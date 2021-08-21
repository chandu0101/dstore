import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/errors.dart';
import 'package:dstore_generator/src/pstate/constants.dart';
import 'package:dstore_generator/src/pstate/generator_helper.dart';
import 'package:dstore_generator/src/pstate/types.dart';
import 'package:dstore_generator/src/pstate/visitors.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:path_to_regexp/path_to_regexp.dart';

const navStateFeilds = [
  "meta",
];

const navStateRegularMethods = [
  "buildPages",
  "notFoundAction",
  "fallBackNestedStackNonInitializationAction",
  "authMeta"
];

Future<String> generatePStateNavForClassElement(
    ClassElement element, PState pstate, BuildStep buildStep) async {
  final inf = isNavPState(element, pstate: pstate);
  if (inf == null) {
    throw InvalidSignatureError(
        "PState ${element.name} should extend NavStateI  / NestedNavStateI ");
  }
  final isNestedNav = inf.startsWith("NestedNav");

  logger.shout("nav interface  $inf");
  final typeParamsTuple =
      AstUtils.getTypeParamsAndBounds(element.typeParameters);
  final typeParamsWithBounds = typeParamsTuple.item2;
  final typeParams = typeParamsTuple.item1;
  final name = element.name.substring(2);
  final nestedNavs = <NestedNavsInfo>[];
  final visitor = PStateAstVisitor(
      element: element,
      isPersitable: false,
      historyEnabled: false,
      nestedNavs: nestedNavs,
      isNav: true);
  final astNode = await AstUtils.getAstNodeFromElement(element, buildStep);
  astNode.visitChildren(visitor);
  final methods = visitor.methods.where((m) => !m.isRegular).toList();
  final regularMethods =
      visitor.methods.where((m) => m.isRegular).map((m) => m.body).join("\n");

  if (!isNestedNav) {
    final keys = ["meta"];
    methods.add(PStateMethod(
        isAsync: false,
        name: "fallBackNestedStackNonInitializationAction2",
        params: [Field(name: "navState", type: "NavCommonI")],
        keysModified: [Field(name: "meta", type: "dynamic")],
        body: """
          final _DstoreActionPayload = _DstoreAction.payload!;
          final navState = _DstoreActionPayload["navState"] as NavStateI;
          ${keys.map((k) => "var ${DSTORE_PREFIX}${k} = ${STATE_VARIABLE}.${k};").join("\n")}
          ${DSTORE_PREFIX}meta = navState.meta;
          final newState = ${STATE_VARIABLE}.copyWith(${keys.map((k) => "${k} : ${DSTORE_PREFIX}${k}").join(",")});
          newState.dontTouchMe = ${STATE_VARIABLE}.dontTouchMe;
          return newState;
        """));
  }
  logger.shout("nav visitor methods $methods");
  var fields = visitor.fields;
  fields.addAll(methods.where((m) => m.isAsync).map((m) => Field(
      name: m.name,
      type: "AsyncActionField",
      value: "AsyncActionField()",
      param: null)));

  fields = ModelUtils.processFields(fields);
  final psDeps = visitor.psDeps;

  print("methods : ${methods.map((e) => e.keysModified)}");
  final isPageUsed = visitor.methods
      .where((m) => m.keysModified.where((f) => f.name == "page").isNotEmpty);
  if (isPageUsed.isNotEmpty && regularMethods.contains("buildPages()")) {
    throw NotAllowedError(
        "You are setting page field and implemented buildPages , which is anot allowed, use only one method");
  }
  var historyMode = "HistoryMode.stack";
  if (isPageUsed.isNotEmpty) {
    historyMode = "HistoryMode.tabs";
  }
  final typePath = getFullTypeName(element);
  final typeVariable = "_${name}_FullPath";

  var typeName = "''";
  String? initialSetup;
  if (isNestedNav) {
    typeName = "'${getFullTypeName(element)}'";
    initialSetup = "${name}Actions.initialSetup(silent:true)";
  }

  final pStateMeta = getPStateMeta(
      modelName: name,
      fields: fields,
      psDeps: psDeps,
      type: typeVariable,
      enableHistory: false,
      actionsMeta: {},
      isNav: true,
      isPersiable: false,
      historyLimit: null,
      navDontTouchMe: NavDontTouchMe(
          staticMeta: _getNavStaticMeta(methods: methods, modelName: name),
          dynamicMeta: _getNavDynamicMeta(methods: methods, modelName: name),
          typeName: typeName,
          initialSetup: initialSetup,
          historyMode: historyMode),
      httpMeta: "",
      methods: methods);

  return """
    
    ${_createPStateNavModel(fields: fields, typeName: typeVariable, regularMethods: regularMethods, exinf: inf, psDeps: psDeps, nestedNavs: nestedNavs, name: name, annotations: [], typeParams: typeParams, enableHistory: false, typaParamsWithBounds: typeParamsWithBounds)}
    const $typeVariable = "$typePath";
    $pStateMeta
    ${_createActions(modelName: name, isMainNav: !isNestedNav, type: typeVariable, methods: methods)}
  """;
}

class NavDontTouchMe {
  final String? url;
  final String staticMeta;
  final String dynamicMeta;
  final String typeName; // empty in main navigation
  final String? initialSetup; // not null for all nested navs
  final String historyMode;

  NavDontTouchMe(
      {this.url,
      required this.staticMeta,
      required this.dynamicMeta,
      required this.typeName,
      required this.initialSetup,
      required this.historyMode});
}

String? isNavPState(ClassElement element, {PState? pstate}) {
  pstate ??= element.getPState();
  if (AstUtils.isSubTypeof(element.thisType, "NestedNavStateI") != null) {
    return "NestedNavStateI";
  } else if (AstUtils.isSubTypeof(element.thisType, "NavStateI") != null) {
    return "NavStateI";
  }
}

String _getNavStaticMeta(
    {required List<PStateMethod> methods, required String modelName}) {
  final m =
      methods.where((m) => m.url != null && !m.url!.contains(":")).map((e) {
    final name = e.params
        .singleWhereOrNull((p) => p.type.startsWith("Map<String,String>"))
        ?.name;

    final params = name != null ? "$name : uri.queryParameters" : "";
    return "'${e.url}' : NavUrlMeta(urlToAction: (Uri uri,Dispatch dispatch) { return dispatch(${modelName}Actions.${e.name}($params));}, url: '${e.url}' ,isProtected: ${e.isNavProtected})";
  }).join(", ");
  return "{$m}";
}

String _getNavDynamicMeta(
    {required List<PStateMethod> methods, required String modelName}) {
  final m =
      methods.where((m) => m.url != null && m.url!.contains(":")).map((e) {
    final parameters = <String>[];
    pathToRegExp('${e.url}', parameters: parameters);
    final params = <String>[];
    e.params.forEach((p) {
      final name = p.name;
      if (parameters.contains(name)) {
        // path param
        final ex = p.type.endsWith("?") ? "" : "!";
        if (p.type.startsWith("num")) {
          if (ex.isEmpty) {
            params.add("$name: num.parse(params['$name']!) ");
          } else {
            params.add(
                "$name: params['$name'] != null ? num.parse(params['$name']!) : null");
          }
        } else if (p.type.startsWith("int")) {
          if (ex.isEmpty) {
            params.add("$name: int.parse(params['$name']!) ");
          } else {
            params.add(
                "$name: params['$name'] != null ? int.parse(params['$name']!) : null");
          }
        } else if (p.type.startsWith("double")) {
          if (ex.isEmpty) {
            params.add("$name: double.parse(params['$name']!) ");
          } else {
            params.add(
                "$name: params['$name'] != null ? double.parse(params['$name']!) : null");
          }
        } else if (p.type.startsWith("String")) {
          params.add("$name : params['$name']$ex");
        } else {
          throw InvalidSignatureError(
              "in method '${e.name} , path param '${name}' type can be one of String/int/double/num , but you specified ${p.type}");
        }
      } else if (p.type.startsWith("Map<String,String>")) {
        // query params
        params.add("$name: uri.queryParameters");
      }
    });

    return """'${e.url}' : NavUrlMeta(url: '${e.url}\',urlToAction : (Uri uri,Dispatch dispatch) { 
      final path = uri.path;
      final parameters = <String>[];
      final regExp = pathToRegExp('${e.url}', parameters: parameters);
      final match = regExp.matchAsPrefix(path);
      final params = extract(parameters, match!);
      return dispatch(${modelName}Actions.${e.name}(${params.join(", ")}));
    }, isProtected: ${e.isNavProtected})
    """;
  }).join(", ");
  return "{$m}";
}

String _createPStateNavModel(
    {required List<Field> fields,
    required List<Field> psDeps,
    required String name,
    required String typeName,
    required List<String> annotations,
    required List<NestedNavsInfo>? nestedNavs,
    required String regularMethods,
    required String typeParams,
    required String exinf,
    required bool enableHistory,
    required String typaParamsWithBounds}) {
  var fb = "";
  if (!exinf.startsWith("Nested")) {
    fb = """
    @override
    Action fallBackNestedStackNonInitializationAction(NavCommonI navState) {
      return ${name}Actions.fallBackNestedStackNonInitializationAction2(navState:navState);
    }
    """;
  }
  final psFeilds = psDeps
      .map((e) =>
          " ${e.type} get ${e.name} => dontTouchMeStore.state.${e.name} as ${e.type};")
      .join("\n");
  final mixins = <String>["PStateStoreDepsMixin", "NavCommonI"];
  var nestedNavsMethod = "";
  if (nestedNavs != null && nestedNavs.isNotEmpty) {
    final list = nestedNavs.map((e) {
      return "getMeta('${e.typeName}','${e.url}',${e.defaultAction})";
    }).join(",");
    nestedNavsMethod = """
      @override
      List<NestedNavStateMeta> getNestedNavs() {
         NestedNavStateMeta getMeta(String psType,String url,Action action) {
           final state = dontTouchMeStore.getPStateModelFromPSType(psType) as NestedNavStateI;
           state.dontTouchMe.rootUrl = url;
           return NestedNavStateMeta(state:state,rootAction:action);
         }
         return [${list}];
       }        
     """;
  }
  var initialSetupMethod = "";
  if (exinf.startsWith("Nested")) {
    initialSetupMethod = """
     @override
     void initialSetup() {
       throw UnimplementedError("This method stubbed out as action ${name}Actions.initialSetup() , use that action instead");
     }
    """;
  }
  final result = """
      
      ${annotations.join("\n")}
      class ${name} extends $exinf<$name> with ${mixins.join(", ")} {
  
        ${ModelUtils.getFinalFieldsFromFieldsList(fields)}
        
        $psFeilds
        $initialSetupMethod
        $regularMethods
        $fb
        $nestedNavsMethod
        
        
        ${ModelUtils.getCopyWithField(name)}
        ${ModelUtils.createConstructorFromFieldsList(name, fields, addConst: false)}

        ${ModelUtils.createCopyWithMapFromFieldsList(name, fields)}

        ${ModelUtils.createToMapFromFieldsList(fields)}
        
        ${ModelUtils.createEqualsFromFieldsList(name, fields)}

        ${ModelUtils.createHashcodeFromFieldsList(fields)}

        ${ModelUtils.createToStringFromFieldsList(name, fields)}

      }

      ${ModelUtils.createCopyWithClasses(name: name, typeParams: typeParams, typeParamsWithBounds: typaParamsWithBounds, fields: fields)}
   """;
  return result;
}

String _createActions(
    {required String modelName,
    required String type,
    required bool isMainNav,
    required List<PStateMethod> methods}) {
  final methodActions = methods.map((m) {
    final paramsList = m.params.map((p) {
      if (!p.isOptional) {
        return "required ${p.type} ${p.name}";
      } else {
        final defaultValue = p.value != null ? "= ${p.value}" : "";
        return "${p.type} ${p.name} ${defaultValue} ";
      }
    }).toList();
    paramsList.add("bool silent = false");
    if (m.isAsync) {
      paramsList.add("Duration? debounce");
    }
    final navPayloadParams = <String>[];
    paramsList.add("NavOptions? navOptions");
    navPayloadParams.add("navOptions: navOptions");

    final params = paramsList.join(", ");

    var payload = "<String,dynamic>{ " +
        m.params.map((p) => """ "${p.name}":${p.name} """).join(",") +
        "}";

    if (payload.isNotEmpty) {
      payload = ", payload: ${payload}";
    }

    if (m.url != null) {
      navPayloadParams.add("rawUrl : '${m.url}'");
    }
    if (m.nestedNavTypeName != null) {
      navPayloadParams.add("nestedNavTypeName : '${m.nestedNavTypeName}'");
    }

    navPayloadParams.add("isProtected: ${m.isNavProtected}");

    return """
      static Action<dynamic> ${m.name}(${params.isEmpty ? "" : "{$params}"})  {
         return Action<dynamic>(name:"${m.name}",silent:silent,nav: NavPayload(${navPayloadParams.join(", ")}),type:${type} ${payload},isAsync: ${m.isAsync}${m.isAsync ? ", debounce: debounce" : ""});
      }
    """;
  }).join("\n");

  return """
    
    abstract class ${modelName}Actions {
      $methodActions
    }
  
  """;
}

UrlInfo? getUrlFromMethod(
    {required List<Field> mparams, required MethodElement methodElement}) {
  final urlAnnot = methodElement.getUrlFromAnnotation();

  final urlInput = urlAnnot?.item1.path;

  logger.shout("Url Input $urlInput");
  var errorMessage = "";
  if (urlInput != null) {
    var finalUrl = urlInput;
    if (urlInput.contains(":")) {
      // dynamic url
      final parameters = <String>[];
      pathToRegExp(urlInput, parameters: parameters);
      final mp = mparams.map((e) => e.name).toSet();
      if (!mp.containsAll(parameters)) {
        throw InvalidSignatureError(
            "you defined dynamic url $urlInput with params $parameters but they are not defined in method ${methodElement.name} params");
      }
      finalUrl = parse(urlInput)
          .map((e) =>
              e is PathToken ? e.value : "\$${(e as ParameterToken).name}")
          .join("");
      if (mparams.length != parameters.length) {
        errorMessage =
            "apart from path params  $parameters action method ${methodElement.name} can have only two extra params at most, param1 of type Map<String,String> that is to specify query params, param2 of type NavOptions? ";
        finalUrl = _validateQueryParamsAndNavOptionsAndUpdateUrlWithQueryParams(
            params: mparams, message: errorMessage, url: finalUrl);
      }
    } else {
      // static url
      errorMessage =
          "static url action method ${methodElement.name} should have only two params at most, param1 of type Map<String,String> that is to specify query params, param2 of type NavOptions?";
      finalUrl = _validateQueryParamsAndNavOptionsAndUpdateUrlWithQueryParams(
          params: mparams, message: errorMessage, url: urlInput);
    }
    return UrlInfo(
      rawUrl: urlInput,
      finalUrl: finalUrl,
      isProtected: urlAnnot?.item1.isProtected ?? false,
      nestedEleemnt: urlAnnot?.item2,
    );
  }
}

class UrlInfo {
  final String rawUrl;
  final String finalUrl;
  final bool isProtected;
  final Element? nestedEleemnt;
  final bool blockSameUrl;

  UrlInfo(
      {required this.rawUrl,
      required this.finalUrl,
      this.nestedEleemnt,
      required this.isProtected,
      this.blockSameUrl = false});

  @override
  String toString() {
    return 'UrlInfo(rawUrl: $rawUrl, finalUrl: $finalUrl, nestedEleemnt: $nestedEleemnt, blockSameUrl: $blockSameUrl)';
  }
}

String _validateQueryParamsAndNavOptionsAndUpdateUrlWithQueryParams(
    {required List<Field> params,
    required String message,
    required String url}) {
  final qp = "Map<String,String>";
  final navOptions = "NavOptions?";
  var result = url;
  bool isAllowedType(String type) =>
      type.startsWith(qp) || type.startsWith(navOptions);
  if (params.length > 2) {
    throw InvalidSignatureError(message);
  }
  if (params.length == 2) {
    final fp = params.first;
    final sp = params.last;
    if (!isAllowedType(fp.type) || !isAllowedType(sp.type)) {
      throw InvalidSignatureError(message);
    }
    var name = "";
    if (fp.type.startsWith(qp)) {
      name = fp.name;
    }
    if (sp.type.startsWith(navOptions)) {
      name = sp.name;
    }
    result = "$url?\${Uri(queryParameters: \${${name}})}";
  }
  if (params.length == 1) {
    final p = params.first;
    if (!isAllowedType(p.type)) {
      throw InvalidSignatureError(message);
    }
    if (p.type.startsWith(qp)) {
      result = "$url?\${Uri(queryParameters: \${${p.name}})}";
    }
  }

  return result;
}

class NestedNavsInfo {
  final String typeName;
  final String url;
  final String defaultAction;

  NestedNavsInfo(
      {required this.typeName, required this.url, required this.defaultAction});

  @override
  String toString() => 'NestedNavsInfo(typeName: $typeName, url: $url)';
}
