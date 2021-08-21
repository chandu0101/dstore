import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/pstate/constants.dart';
import 'package:dstore_generator/src/pstate/http.dart';
import 'package:dstore_generator/src/pstate/nav/nav_generator_helper.dart';
import 'package:dstore_generator/src/pstate/persitance.dart';
import 'package:dstore_generator/src/pstate/stream.dart';
import 'package:dstore_generator/src/pstate/types.dart';
import 'package:dstore_generator/src/pstate/visitors.dart';
import 'package:dstore_generator/src/pstate/websocket.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';
import "dart:convert";

Future<String> generatePStateForClassElement(
    ClassElement element, BuildStep buildStep) async {
  final pstate = element.getPState();
  print("pstate value for ${element.name} : $pstate");
  if (pstate.nav == true) {
    return await generatePStateNavForClassElement(element, pstate, buildStep);
  }
  final typeParamsTuple =
      AstUtils.getTypeParamsAndBounds(element.typeParameters);
  final typeParamsWithBounds = typeParamsTuple.item2;
  final typeParams = typeParamsTuple.item1;
  final modelName = element.name.substring(2);

  final isPerssit = isPersitable(pstate);
  final visitor = PStateAstVisitor(
      element: element,
      isPersitable: isPerssit,
      historyEnabled: pstate.enableHistory,
      historyLimit: pstate.historyLimit);
  //TODO we dont getResolvedAstNodeFromElement all the time , may be add a flag to pstate based on that swith between normal/resolved ast , revisit this if build_runner taking so much time.
  // final tracker = AsyncTimeTracker();
  // // final astNode = tracker.track(() => AstUtils.getAstNodeFromElement(element));

  // final astNode = await tracker.track(() async {
  //   return await AstUtils.getResolvedAstNodeFromElement(element);
  // });
  // logger.shout("TimeTracker ${tracker.duration.inMilliseconds}  $tracker");
  final astNode =
      await AstUtils.getAstNodeFromElement(element, buildStep, resolve: false);
  astNode.visitChildren(visitor);
  var fields = visitor.fields;
  final methods = visitor.methods.where((m) => !m.isRegular).toList();
  final regularMaethods =
      visitor.methods.where((m) => m.isRegular).map((m) => m.body).join("\n");
  final psDeps = visitor.psDeps;
  print("psdeps ${visitor.psDeps}");
  fields.addAll(methods.where((m) => m.isAsync).map((m) => Field(
      name: m.name,
      type: "AsyncActionField",
      value: "AsyncActionField()",
      param: null)));
  fields = ModelUtils.processFields(fields);
  logger.shout("Fields $fields Methods $methods");
  final typePath = getFullTypeName(element);
  final typeVariable = "_${modelName}_FullPath";
  final actionsInfo = _getActionsInfo(
    element: element,
    fields: fields,
    methods: methods,
    modelName: modelName,
    enableHistory: pstate.enableHistory,
    type: typeVariable,
  );
  final actionsmeta = _getActionsmeta(methods, actionsInfo.specialActions);
  final actions = actionsInfo.actions;
  final pstateMeta = getPStateMeta(
      modelName: modelName,
      fields: fields,
      psDeps: psDeps,
      persitMigrator: pstate.interMigratorName,
      methods: methods,
      actionsMeta: actionsmeta,
      httpMeta: actionsInfo.httpMeta,
      type: typeVariable,
      isPersiable: isPerssit,
      historyLimit: pstate.historyLimit,
      enableHistory: pstate.enableHistory);

  final annotations = <String>[];
  if (isPerssit) {
    annotations.add("@JsonSerializable()");
  }
  final result = """
       ${_createPStateModel(fields: fields, regularMethods: regularMaethods, psDeps: psDeps, name: modelName, annotations: annotations, typaParamsWithBounds: typeParamsWithBounds, typeParams: typeParams, enableHistory: pstate.enableHistory)}
       const $typeVariable = "$typePath";
       ${actions}
        ${pstateMeta}
        ${isPerssit ? getStorageSerializerAndDeserializer(className: modelName, fields: fields) : ""}
    """;
  return result;
}

String getStorageSerializerAndDeserializer(
    {required String className, required List<Field> fields}) {
  //  final serializer =
  final sName = "${className}StorageSerializer";
  final storageSerializer = """
      dynamic $sName(dynamic value) {
        final s = value as $className;
        return s.toJson();
      }
    """;
  final dName = "${className}StorageDeserializer";
  var storageDeserializer = """
       $className $dName(dynamic value) {
         return $className.fromJson(value as Map<String,dynamic>);
       }
    """;
  final defaultFields =
      fields.where((f) => f.value != null && f.value != "null").toList();
  if (defaultFields.isNotEmpty) {
    final patch = defaultFields.map((e) {
      final name = e.name;
      final value = e.value;
      return """
         if(!json.containsKey('$name')) {
           
         }
      """;
    });
    // storageDeserializer = """
    //  $className $dName(dynamic value) {
    //      final json = value as Map<String,dynamic>;

    //      return $className.fromJson(json);
    //    }
    // """;
  }
  return """
   $storageSerializer
   $storageDeserializer
  """;
}

Map<String, List<String>> _getActionsmeta(
    List<PStateMethod> methods, List<String> specialActions) {
  final map = <String, List<String>>{};
  map.addEntries(methods.map(
      (e) => MapEntry(e.name, e.keysModified.map((e) => e.name).toList())));
  map.addEntries(specialActions.map((e) => MapEntry(e, [e])));
  return map;
}

String getFullTypeName(ClassElement element) {
  var path = element.source.fullName.replaceAll(".dart", "");
  if (path.contains("/src/")) {
    path = path.substring(path.indexOf("/src/") + 4);
  } else if (path.contains("/lib/")) {
    path = path.substring(path.indexOf("/lib/") + 4);
  }
  return "$path/${element.name.substring(2)}";
}

String getPStateMeta(
    {required String modelName,
    required List<Field> fields,
    required List<Field> psDeps,
    required String type,
    required bool enableHistory,
    required Map<String, List<String>> actionsMeta,
    required bool isPersiable,
    required int? historyLimit,
    String? persitMigrator,
    bool isNav = false,
    NavDontTouchMe? navDontTouchMe,
    required String httpMeta,
    required List<PStateMethod> methods}) {
  final syncReducerFunctionStr =
      createReducerFunctionSync(methods.where((m) => !m.isAsync), modelName);
  final asyncReducerFubctionStr =
      createReducerFunctionAsync(methods.where((m) => m.isAsync), modelName);
  print(fields);

  var defaultState =
      "${modelName}(${fields.map((f) => "${f.name}:${f.type.startsWith("FormField") ? _addActionNameAndGroupNameToFormField(value: f.value!, actionName: f.name, type: type) : f.value}").join(", ")})";
  var defaultStateFn = "$modelName ${modelName}_DS() => $defaultState;";
  final params = <String>["type : $type"];
  if (syncReducerFunctionStr.isNotEmpty) {
    params.add("reducer: ${modelName}_SyncReducer");
  }
  if (asyncReducerFubctionStr.isNotEmpty) {
    params.add("aReducer: ${modelName}_AsyncReducer");
  }
  params.add("ds: ${modelName}_DS");
  if (httpMeta.isNotEmpty) {
    params.add("httpMetaMap: $httpMeta");
  }
  // if (psDeps.isNotEmpty) {
  //   params.add('psDeps: [${psDeps.map((e) => '"${e.value}"').join(", ")}]');
  // }

  if (isPersiable) {
    final sName = "${modelName}StorageSerializer";

    final dsName = "${modelName}StorageDeserializer";

    final smParams = <String>[];
    smParams.add("serializer: $sName");
    smParams.add("deserializer: $dsName");
    if (persitMigrator != null) {
      smParams.add("migrator: $persitMigrator");
    }
    params.add(
        "sm: PStateStorageMeta<$modelName,Map<String,dynamic>>(${smParams.join(", ")})");
  }

  if (enableHistory) {
    params.add("enableHistory: true");
    params.add("actionsMeta: ${jsonEncode(actionsMeta)}");
  }
  if (enableHistory || isNav) {
    defaultStateFn = """
      $modelName ${modelName}_DS() {
        final state = $defaultState;
        ${enableHistory ? "state.dontTouchMePSHistory = PStateHistory<$modelName>($historyLimit);" : ""} 
        ${isNav ? """
          state.dontTouchMe.staticMeta = ${navDontTouchMe!.staticMeta};
          state.dontTouchMe.dynamicMeta = ${navDontTouchMe.dynamicMeta};
          state.dontTouchMe.typeName = ${navDontTouchMe.typeName};
          state.dontTouchMe.initialSetup = ${navDontTouchMe.initialSetup};
          state.dontTouchMe.historyMode = ${navDontTouchMe.historyMode};
        """ : ""}
        return state;
      }
    """;
  }

  return """
       $syncReducerFunctionStr
       $asyncReducerFubctionStr
       $defaultStateFn

       final ${modelName}Meta = PStateMeta<${modelName}>(${params.join(", ")});
    """;
}

ActionsInfo _getActionsInfo(
    {required ClassElement element,
    required List<PStateMethod> methods,
    required List<Field> fields,
    required String modelName,
    required bool enableHistory,
    required String type}) {
  final specialActions = <String>[];
  final httpFields = getHttpFields(element.fields);
  specialActions.addAll(httpFields.map((e) => e.name));
  final streamFields = getStreamFields(element.fields);
  specialActions.addAll(streamFields.map((e) => e.name));
  final websocketFields = getWebSocketFields(element.fields);
  specialActions.addAll(websocketFields.map((e) => e.name));
  final formFields =
      fields.where((f) => f.type.toString().startsWith("FormField")).toList();
  final actions = _generateActionsCreators(
      methods: methods,
      modelName: modelName,
      type: type,
      streamFields: streamFields,
      psHistoryEnabled: enableHistory,
      websocketFields: websocketFields,
      formFields: formFields,
      httpFields: httpFields);
  var httpMeta = httpFields.map((h) {
    final key = h.name;
    final params = <String>[];
    if (h.inputSerializer != null) {
      params.add("inputSerializer: ${h.inputSerializer}");
    }
    var qType = "Null";
    if (h.queryParamsType != null) {
      qType = h.queryParamsType!;
      params.add("queryParamsSerializer : ${h.queryParamsType}.toJsonStatic");
      params
          .add("queryParamsDeserializer : ${h.queryParamsType}.fromJsonStatic");
    }
    var pType = "Null";
    if (h.pathParamsType != null) {
      pType = h.pathParamsType!;
      params.add("pathParamsSerializer : ${h.pathParamsType}.toJsonStatic");
      params.add("pathParamsDeserializer : ${h.pathParamsType}.fromJsonStatic");
    }
    if (h.inputDeserializer != null) {
      params.add("inputDeserializer: ${h.inputDeserializer}");
    }
    if (h.responseSerializer != null) {
      params.add("responseSerializer: ${h.responseSerializer}");
    }
    if (h.canProcessOfflineAction != null) {
      params.add("canProcessOfflineAction: ${h.canProcessOfflineAction}");
    }
    if (h.persitDataBetweenFetches) {
      params.add("persitDataBetweenFetches: true");
    }
    if (h.transformer != null) {
      params.add("transformer: ${h.transformer}");
    }
    params.add("responseDeserializer: ${h.responseDeserializer}");

    final value =
        "HttpMeta<${pType},${qType},${h.inputType},${h.responseType},${h.errorType},${h.transformType}>(${params.join(", ")})";

    return """ "$key" : $value """;
  }).join(", ");
  if (httpMeta.isNotEmpty) {
    httpMeta = "{$httpMeta}";
  }

  return ActionsInfo(
      actions: actions, httpMeta: httpMeta, specialActions: specialActions);
}

extension PStateExtension on ClassElement {
  PState getPState() {
    final annot = annotationFromType(PState);
    if (annot == null) {
      throw ArgumentError.value(
          "${this.name}  class should be annotated with @Pstate annotation");
    }
    print("pstateannot ${this.name} $annot");
    final reader = ConstantReader(annot.computeConstantValue());
    final persist = reader.peek("persist")?.boolValue;
    final enableHistory = reader.peek("enableHistory")?.boolValue;
    final historyLimit = reader.peek("historyLimit")?.intValue;
    final nav = reader.peek("nav")?.boolValue;
    final navBlockSameUrl = reader.peek("navBlockSameUrl")?.boolValue;
    final persitMigrator = reader.functionNameForField("persitMigrator");
    final collectionEquality =
        reader.getEnumField("collectionEquality", CollectionEquality.values);
    return PState(
        persist: persist,
        enableHistory: enableHistory ?? false,
        nav: nav,
        historyLimit: historyLimit,
        interMigratorName: persitMigrator,
        collectionEquality: collectionEquality,
        navBlockSameUrl: navBlockSameUrl);
  }
}

String _addActionNameAndGroupNameToFormField(
    {required String value, required String actionName, required String type}) {
  return "${value.substring(0, value.lastIndexOf(")"))},internalAName: \"$actionName\",internalAType:$type)";
}

String _generateActionsCreators({
  required List<PStateMethod> methods,
  List<HttpFieldInfo> httpFields = const [],
  List<StreamFieldInfo> streamFields = const [],
  List<WebSocketFieldInfo> websocketFields = const [],
  Iterable<Field> formFields = const [],
  required String modelName,
  bool psHistoryEnabled = false,
  required String type,
}) {
  final mockModels = <String>[];
  final methodActions = methods.map((m) {
    final paramsList = m.params.map((p) {
      if (!p.type.endsWith("?")) {
        return "required ${p.type} ${p.name}";
      } else {
        final defaultValue = p.value != null ? "= ${p.value}" : "";
        return "${p.type} ${p.name} ${defaultValue} ";
      }
    }).toList();
    if (m.isAsync) {
      paramsList.add("Duration? debounce");
    }
    final mockName = getMockModelName(modelName: modelName, name: m.name);
    mockModels.add(_createMockModel(name: mockName, fields: m.keysModified));
    paramsList.add("bool silent = false");
    final params = paramsList.join(", ");
    final specialParams = <String>[];
    final keysModified = jsonEncode(m.keysModified.map((e) => e.name).toList());

    if (psHistoryEnabled) {
      specialParams.add("'$PSHISTORY_KEYS_MODIFIED_KEY' : $keysModified");
    }

    final payloadParams = <String>[];

    m.params.forEach((p) => payloadParams.add('"${p.name}":${p.name} '));
    payloadParams.addAll(specialParams);
    var payload = m.params.isNotEmpty || specialParams.isNotEmpty
        ? """<String,dynamic>{ 
             ${specialParams.join(", ")},
             
            }
            """
        : "";
    if (payloadParams.isNotEmpty) {
      payload = ", payload: <String,dynamic>{ ${payloadParams.join(", ")},}";
    }
    var psHistoryPayload = "";
    if (psHistoryEnabled) {
      psHistoryPayload =
          ",psHistoryPayload : PSHistoryPayload(keysModified:$keysModified)";
    }

    return """
      static Action<$mockName> ${m.name}(${params.isEmpty ? "" : "{$params}"})  {
         return Action<$mockName>(name:"${m.name}",silent:silent,type:${type} $psHistoryPayload ${payload},isAsync: ${m.isAsync}${m.isAsync ? ", debounce: debounce" : ""});
      }
      
      static Action<${mockName}> ${m.name}Mock($mockName mock) {
        return Action<$mockName>(name:"${m.name}",type:${type}, mock:mock$psHistoryPayload);
      }
    """;
  }).join("\n");
  final httpActions = httpFields
      .map((hf) => convertHttpFieldInfoToAction(
          hf: hf,
          type: type,
          modelName: modelName,
          psHistoryEnabled: psHistoryEnabled))
      .join("\n");

  final streamActions = streamFields
      .map((e) => convertStreamFieldInfoToAction(
          sfi: e, type: type, psHistoryEnabled: psHistoryEnabled))
      .join("\n");

  final websocketActions = websocketFields
      .map((e) => convertWebSocketFieldInfoToAction(
          wsi: e, type: type, psHistoryEnabled: psHistoryEnabled))
      .join("\n");

  final formActions = formFields.map((ff) {
    var psHistoryPayload = "";
    if (psHistoryEnabled) {
      psHistoryPayload =
          ",psHistoryPayload : PSHistoryPayload(keysModified:['${ff.name}'])";
    }
    return """
   static Action<dynamic> ${ff.name}(FormReq req) {
     return Action<dynamic>(name:"${ff.name}",type:${type},form:req$psHistoryPayload);
   }
   """;
  }).join("\n");

  var undoRedoActions = "";
  if (psHistoryEnabled) {
    undoRedoActions = """
     static Action<dynamic> undo() {
       return Action<dynamic>(name:"undo",type:${type},psHistoryPayload : PSHistoryPayload(keysModified:[]));
     }
       static Action<dynamic> redo() {
       return Action<dynamic>(name:"redo",type:${type},psHistoryPayload : PSHistoryPayload(keysModified:[]));
     }

      static Action<dynamic> clearHistory() {
       return Action<dynamic>(name:"clearHistory",type:${type},psHistoryPayload : PSHistoryPayload(keysModified:[]));
     }
    
    """;
  }

  return """
      ${mockModels.join("\n")}

     abstract class ${modelName}Actions {
         ${methodActions}
         ${httpActions}
         ${formActions}
         ${streamActions}
         ${websocketActions}
         ${undoRedoActions}
     }
  """;
}

String getMockModelName({required String modelName, required String name}) {
  return "$modelName${name.cpatialize}Result";
}

String _createMockModel({required String name, required List<Field> fields}) {
  final finalFields = fields.map((e) {
    final type = e.type.endsWith("?") ? "Optional<${e.type}>" : "${e.type}?";
    return "final $type ${e.name};";
  }).join("\n ");
  final ctorParams = fields.map((e) {
    return e.type.endsWith("?")
        ? "this.${e.name} = optionalDefault"
        : "this.${e.name}";
  }).join(", ");
  final toMapStatements = fields.map((e) {
    if (e.type.endsWith("?")) {
      return """
        if(${e.name} != optionalDefault) {
          map["${e.name}"] = ${e.name}.value;
        }
      """;
    } else {
      return """
        if(${e.name} != null) {
          map["${e.name}"] = ${e.name};
        }      
      """;
    }
  }).join("\n");
  return """
    class $name implements ToMap<$name> {
     
     $finalFields

     const ${name}({$ctorParams});
     @override
     Map<String,dynamic> toMap() {
       final map = <String,dynamic>{};
        $toMapStatements
       return map;
     }
      @override
      $name copyWithMap(Map<String,dynamic> map) => throw UnimplementedError();
    }
  
  """;
}

String _createPStateModel(
    {required List<Field> fields,
    required List<Field> psDeps,
    required String name,
    required List<String> annotations,
    required String typeParams,
    required String regularMethods,
    required bool enableHistory,
    required String typaParamsWithBounds}) {
  final isJson = annotations.singleWhereOrNull(
          (element) => element.startsWith("@JsonSerializable")) !=
      null;
  // final historyField = enableHistory
  //     ? """
  //     set internalPSHistory(PStateHistory<$name> value) {
  //       _psHistory = value;
  //     }
  //    """
  //     : "";
  final mixins = <String>[];

  if (enableHistory) {
    mixins.add("PStateHistoryMixin<$name>");
  }
  if (psDeps.isNotEmpty) {
    mixins.add("PStateStoreDepsMixin");
  }
  final m = mixins.isNotEmpty ? "with ${mixins.join(",")}" : "";

  final psFeilds = psDeps
      .map((e) =>
          " ${e.type} get ${e.name} => dontTouchMeStore.state.${e.name} as ${e.type};")
      .join("\n");

  final result = """
      
      @immutable
      ${annotations.join("\n")}
      class ${name} extends PStateModel<$name> $m {
  
        ${ModelUtils.getFinalFieldsFromFieldsList(fields)}
        $regularMethods
        $psFeilds
        ${ModelUtils.getCopyWithField(name)}
        ${ModelUtils.createConstructorFromFieldsList(name, fields, addConst: false)}

        ${ModelUtils.createCopyWithMapFromFieldsList(name, fields)}

        ${ModelUtils.createToMapFromFieldsList(fields)}
        
        ${ModelUtils.createEqualsFromFieldsList(name, fields)}

        ${ModelUtils.createHashcodeFromFieldsList(fields)}

        ${ModelUtils.createToStringFromFieldsList(name, fields)}

        ${isJson ? ModelUtils.createFromJson(name) : ""}

        ${isJson ? ModelUtils.createToJson(name) : ""}
      }

      ${ModelUtils.createCopyWithClasses(name: name, typeParams: typeParams, typeParamsWithBounds: typaParamsWithBounds, fields: fields)}
   """;
  return result;
}

String createReducerFunctionSync(
  Iterable<PStateMethod> methods,
  String modelName,
) {
  if (methods.isEmpty) {
    return "";
  }
  final cases = methods.map((m) => """
     case "${m.name}": {
       ${m.body}
     }
  """).join("\n");
  return """ 
   dynamic ${modelName}_SyncReducer(dynamic ${STATE_VARIABLE},Action ${ACTION_VARIABLE}) {
      ${STATE_VARIABLE} = ${STATE_VARIABLE} as ${modelName};
      final name = ${ACTION_VARIABLE}.name;
      switch(name) {
        ${cases}
       default: {
        return ${STATE_VARIABLE};
       }
      }
    }
  """;
}

String createReducerFunctionAsync(
  Iterable<PStateMethod> methods,
  String modelName,
) {
  if (methods.isEmpty) {
    return "";
  }
  final cases = methods.map((m) => """
     case "${m.name}": {
       ${m.body}
     }
  """).join("\n");
  return """ 
   Future<dynamic> ${modelName}_AsyncReducer(dynamic ${STATE_VARIABLE},Action ${ACTION_VARIABLE}) async {
      ${STATE_VARIABLE} = ${STATE_VARIABLE} as ${modelName};
      final name = ${ACTION_VARIABLE}.name;
      switch(name) {
        ${cases}
       default: {
        return ${STATE_VARIABLE};
       }
      }
    }
  """;
}
