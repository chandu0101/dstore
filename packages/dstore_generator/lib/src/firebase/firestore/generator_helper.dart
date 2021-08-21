import 'dart:io';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/constants.dart';
import 'package:dstore_generator/src/firebase/firestore/ops/visitors.dart';
import 'package:dstore_generator/src/graphql/schema_source/generator_helper.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:source_gen/source_gen.dart';
import 'package:tuple/tuple.dart';

Future<String> generateFireStoreSchema(
    {required ClassElement element, required BuildStep buildStep}) async {
  var collectionModels = "";
  var collectionDsl = "";
  var collectionsRefs = "";
  var nestedObjects = "";
  final schemaMeta = getFireStoreSchemaFromAnnotation(element);
  final collectionSecurityRules = <String>[];
  print("firestore fields ${element.fields}");
  element.fields.forEach((f) {
    final name = f.name.toLowerCase();
    if (name.toLowerCase() == "collections") {
      final ce = f.type.element as ClassElement;
      collectionModels = getModelsFromCollections(element: ce);
      collectionDsl = getDslFromCollections(
          element: ce, securityRules: collectionSecurityRules);
      collectionsRefs = getDefaultCollectionRefs(element: ce);
    }
    if (name.toLowerCase() == "nestedobjects") {
      final ce = f.type.element as ClassElement;
      nestedObjects = getNestedObjects(element: ce);
    }
  });

  await saveSecurityRulesToFile(
      schemaMeta: schemaMeta, collectionSecurityRules: collectionSecurityRules);
  return """
    $collectionModels
    $collectionDsl 
    $collectionsRefs
    $nestedObjects
  """;
}

Future<void> saveSecurityRulesToFile(
    {required FireStoreSchema schemaMeta,
    required List<String> collectionSecurityRules}) async {
  final path = schemaMeta.rulesPath;
  final globalRules = schemaMeta.rules
          ?.map((r) => convertSecurityRuleToString(rule: r))
          .join("\n") ??
      "";
  final rules = """
   rules_version = '2';
   service cloud.firestore {
      match /databases/{database}/documents {
        $globalRules 
        ${collectionSecurityRules.join("\n")}
      }
   }   
  """;

  await File(path).writeAsString(rules);
}

String convertSecurityRuleToString(
    {required SecurityRule? rule, ClassElement? element}) {
  final collectionName = element?.collectionAnnotation.name;
  final functions = rule?.functions ?? "";
  final match = rule?.match != null
      ? rule!.match
      : collectionName != null
          ? "/${collectionName}/{document}"
          : ""; // probbaly throw error
  final read = rule?.read != null ? "allow read: ${rule!.read};" : "";
  final write = rule?.write != null ? "allow write: ${rule!.write};" : "";
  final update = rule?.update != null ? "allow update: ${rule!.update};" : "";
  final create = rule?.create != null ? "allow create: ${rule!.create};" : "";
  final get = rule?.get != null ? "allow get: ${rule!.get};" : "";
  final list = rule?.list != null ? "allow list: ${rule!.list};" : "";
  final delete = rule?.delete != null ? "allow delete: ${rule!.delete};" : "";
  var defaultFunctions = "";
  var subCollectionRules = "";
  if (element != null) {
    // for now lets do collections
    final tuple = getDefaultSecurityFunctions(element: element);
    defaultFunctions = tuple.item1;
    subCollectionRules = tuple.item2.map((fe) {
      final element = fe.type.element! as ClassElement;
      final ca = element.collectionAnnotation;
      return convertSecurityRuleToString(rule: ca.rules, element: element);
    }).join("\n");
  }
  return """
     $functions
     $defaultFunctions
     match $match {
       $read 
       $write
       $update
       $create
       $get 
       $list
       $delete

       $subCollectionRules
     }
   """;
}

Tuple2<String, List<FieldElement>> getDefaultSecurityFunctions({
  required ClassElement element,
  DefautSecurityOrValidateFunctions? df,
}) {
  final subCollFields = <FieldElement>[];
  final reqProps = <String>[];
  final allProps = <String>[];
  element.fields.forEach((element) {
    final ca = element.type.element?.annotationFromType(collection);
    final type = element.type.toString();
    final name = element.name;
    if (ca == null) {
      // care about only non sub collection fields
      if (!type.endsWith("?")) {
        reqProps.add(name);
      }
      allProps.add(name);
    } else {
      subCollFields.add(element);
    }
  });
  if (df == null) {
    return Tuple2("", subCollFields);
  }
  final collectionName = element.collectionAnnotation.name;
  final fns = <String>[];
  if (df.validFieldNames) {
    fns.add(FireStoreGlobalSecurityOrValidationFunctionsMeta
        .validFieldNamesForCollection(
            collectionName: collectionName,
            requiredProps: reqProps,
            allProps: allProps));
  }
  return Tuple2(fns.join("\n"), subCollFields);
}

String getNestedObjects({required ClassElement element}) {
  assetItHasInterfacess(element);
  return element.interfaces.where((e) => !e.isDartCoreObject).map((e) {
    final element = e.element;
    print("generating for nested object ${element.name}");
    final className = element.name;
    final fields = ModelUtils.convertFieldElementsToFields(element.fields);
    var updateClass = "";
    if (!fields.every((f) => f.type.endsWith("?"))) {
      final updateFields = fields
          .map((f) => f.copyWith(type: f.type.addQuestionMarkAtEnd))
          .toList();
      updateClass = ModelUtils.createDefaultDartUpdateModelFromFeilds(
          fields: updateFields,
          className: className + "Update",
          isJsonSerializable: true);
    }

    return """
     ${ModelUtils.createDefaultDartModelFromFeilds(fields: fields, className: className, isJsonSerializable: true)}
     ${updateClass}
     """;
  }).join("\n");
}

String getDefaultCollectionRefs({required ClassElement element}) {
  final colRefs =
      element.allSupertypes.where((e) => !e.isDartCoreObject).map((e) {
    final element = e.element;
    final ca = element.collectionAnnotation;
    final cname = ca.name;
    final cMethod = ca.sub ? "collectionGroup" : "collection";
    final converter = ca.sub ? "" : ".${getWithConverter(element.name)}";
    return """static final ${ca.name} = 
     FirebaseFirestore.instance.$cMethod('$cname')$converter;
     """;
  }).join("\n");
  return """
     class CollectionRefs {
       $colRefs
     }
    """;
}

String getModelsFromCollections({required ClassElement element}) {
  assetItHasInterfacess(element);
  return element.interfaces
      .where((e) => !e.isDartCoreObject)
      .map((e) => convertCollectionModelToDartModel(element: e.element))
      .join("\n");
}

String convertCollectionModelToDartModel({required ClassElement element}) {
  final className = element.name;
  final regularFields = <Field>[];
  final updateFields = <Field>[];
  element.fields
      .where((f) =>
          f.type.element?.annotationFromType(collection) ==
          null) // subcollections are shallow
      .forEach((f) {
    final name = f.name;
    final type = f.type;
    var typeStr = type.toString();
    final annotations = f.metadata.map((e) => e.toSource()).toList();
    final updateAnnotations = f.metadata.map((e) => e.toSource()).toList();
    if (typeStr.startsWith("FireStoreRef")) {
      if (!typeStr.startsWith("FireStoreRef<")) {
        throw ArgumentError.value(
            "FireStoreRef field ${name} should provide generic type of collection");
      }
      final cType =
          typeStr.substring(typeStr.indexOf("<") + 1).replaceAll(">", "");
      if (cType == "dynamic") {
        throw ArgumentError.value(
            "FireStoreRef fields should provide generic type of collection class not dynamic");
      }
      var op = "";
      var optional = "";
      if (typeStr.endsWith("?")) {
        op = "?";
        optional = "Optional";
      }
      final refName = "${cType}Reference";
      typeStr = "$refName$op";
      annotations.add(
          "@JsonKey(fromJson: ${refName}.fromJson${optional} ,toJson: ${refName}.toJson$optional)");
      updateAnnotations.add(
          "@JsonKey(fromJson: ${refName}.fromJsonOptional ,toJson: ${refName}.toJsonOptional)");
    }
    final rf = Field(
        name: name,
        type: typeStr,
        isOptional: typeStr.endsWith("?"),
        annotations: annotations);
    regularFields.add(rf);
    updateFields.add(rf.copyWith(
        type: rf.type.addQuestionMarkAtEnd,
        isOptional: true,
        annotations: updateAnnotations));
  });
  var updateClass = "";
  if (!regularFields.every((f) => f.type.endsWith("?"))) {
    final updateClassName = className + "Update";

    updateClass = ModelUtils.createDefaultDartUpdateModelFromFeilds(
        fields: updateFields,
        className: updateClassName,
        isJsonSerializable: true);
  }

  return """
   ${_createReferenceClass(className)}
  ${updateClass} 
  ${ModelUtils.createDefaultDartModelFromFeilds(fields: regularFields, className: className, isJsonSerializable: true)} 
  
  """;
}

String _createReferenceClass(String name) {
  final refName = "${name}Reference";
  return """
    class $refName {
      
       final DocumentReference docRef;
       $refName(this.docRef);

    static $refName fromJson(dynamic docRef) =>
      $refName(docRef as DocumentReference);

     static dynamic toJson($refName mref) => mref.docRef;
  
     static $refName? fromJsonOptional(dynamic? docRef) =>
       docRef != null ? $refName(docRef as DocumentReference) : null;

     static dynamic toJsonOptional($refName? mref) => mref?.docRef;
  
      Future<$name?> get([GetOptions? options]) async {
        final snapshot = await docRef.get(options);
        var data = snapshot.data();
        if(data != null) {
          return $name.fromJson(data as Map<String,dynamic>); 
        } 
      }
    }
  """;
}

String getDslFromCollections(
    {required ClassElement element, required List<String> securityRules}) {
  final queryItems = <String>[];
  final groupedQueryItems = <String>[];
  final types = <String>[];
  element.allSupertypes.where((e) => !e.isDartCoreObject).forEach((e) {
    final cElement = e.element;
    final ca = cElement.collectionAnnotation;
    final name = "${ca.name}_${cElement.name}";
    types.add(
        convertCollectionModelToDartDSLQuery(element: cElement, name: name));
    final qfn = "static ${name}Query $name() { throw Error();}";
    if (ca.sub) {
      groupedQueryItems.add(qfn);
    } else {
      queryItems.add(qfn);
      securityRules
          .add(convertSecurityRuleToString(rule: ca.rules, element: cElement));
    }
  });
  return """
   
   abstract class FireStoreQuery {
     ${queryItems.join("\n")}
   }
   
   abstract class FireStoreGroupQuery {
     ${groupedQueryItems.join("\n")}
   }

   ${types.join("\n")}
  
  """;
}

extension CollectionElementExt on Element {
  collection get collectionAnnotation {
    final annot = this.annotationFromType(collection);
    if (annot == null) {
      throw ArgumentError.value(
          "All collection classes should add @collection annotation, there is no collection annotion for class ${this.name}");
    }
    final reader = ConstantReader(annot.computeConstantValue());
    final name = reader.peek("name")?.stringValue;
    final sub = reader.peek("sub")?.boolValue ?? false;
    final rulesObj = reader.peek("rules");
    SecurityRule? rules;
    if (rulesObj != null) {
      rules = convertDartObjectToSecurity(rulesObj.objectValue);
    }
    return collection(name: name!, sub: sub, rules: rules);
  }
}

SecurityRule convertDartObjectToSecurity(DartObject obj) {
  final reader = ConstantReader(obj);
  final read = reader.peek("read")?.stringValue;
  final match = reader.peek("match")?.stringValue;
  final update = reader.peek("update")?.stringValue;
  final write = reader.peek("write")?.stringValue;
  final create = reader.peek("create")?.stringValue;
  final get = reader.peek("get")?.stringValue;
  final list = reader.peek("list")?.stringValue;
  final delete = reader.peek("delete")?.stringValue;
  final functions = reader.peek("functions")?.stringValue;
  final defaultFunctionsObj = reader.peek("defaultFunctions");
  DefautSecurityOrValidateFunctions? defaultFunctions;
  if (defaultFunctionsObj != null) {
    final validFieldNames = reader.peek("validFieldNames")?.boolValue ?? false;
    defaultFunctions =
        DefautSecurityOrValidateFunctions(validFieldNames: validFieldNames);
  }

  return SecurityRule(
      read: read,
      match: match,
      update: update,
      create: create,
      write: write,
      get: get,
      list: list,
      functions: functions,
      delete: delete,
      defaultFunctions: defaultFunctions);
}

String convertCollectionModelToDartDSLQuery(
    {required ClassElement element, required String name}) {
  final genericQueryFields = <String>[];
  final queryClassName = "${name}Query";

  genericQueryFields
      .add("$queryClassName limit(int limit) { $CompileTimeError }");
  genericQueryFields
      .add("$queryClassName limitToLast(int limit) { $CompileTimeError}");
  genericQueryFields.add(
      "$queryClassName orderBy(Object field,{bool descending = false}) { $CompileTimeError}");
  genericQueryFields.add("""
      $queryClassName where(
          Object field, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,}
      ) { $CompileTimeError}
      """);

  genericQueryFields.add(
      "$queryClassName endAtDocument(DocumentSnapshot documentSnapshot) { $CompileTimeError }");

  genericQueryFields.add(
      "$queryClassName startAtDocument(DocumentSnapshot documentSnapshot) {  $CompileTimeError }");
  genericQueryFields.add(
      "$queryClassName startAfterDocument(DocumentSnapshot documentSnapshot) {  $CompileTimeError }");

  genericQueryFields.add(
      "$queryClassName startAfter(List<Object?> values) { $CompileTimeError }");
  genericQueryFields
      .add("$queryClassName endAt(List<Object?> values) { $CompileTimeError }");
  genericQueryFields.add(
      "$queryClassName endBefore(List<Object?> values) { $CompileTimeError }");
  final subCollectionFields = <FieldElement>[];
  final fields = element.fields.map((f) {
    final name = f.name;
    final type = f.type;
    final typeStr = type.toString();
    final sca = f.type.element?.annotationFromType(collection);
    final t = type.toString().addQuestionMarkAtEnd;
    if (sca != null) {
      // sub collection field
      subCollectionFields.add(f);
      return "";
    } else if (type.isDartCoreList) {
      //
      return """
        $queryClassName where_$name({ Object? arrayContains,
    List<Object?>? arrayContainsAny,}) { $CompileTimeError }
      """;
    } else if (type.isDartCoreMap) {
    } else if (type.isDartCoreBool) {
      return """
       $queryClassName where_$name(
          $t isEqualTo,
    $t isNotEqualTo,
    $t whereIn,
    $t whereNotIn,
       ) {
$CompileTimeError
       }
      $queryClassName orderBy_$name({bool descending = false}) {
    $CompileTimeError
      }
      """;
    } else if (type.isDartCoreDouble ||
        type.isDartCoreInt ||
        type.isDartCoreNum ||
        type.isDartCoreString) {
      return """
       
       $queryClassName where_$name(
          $t isEqualTo,
    $t isNotEqualTo,
    $t isLessThan,
    $t isLessThanOrEqualTo,
    $t isGreaterThan,
    $t isGreaterThanOrEqualTo,
    $t whereIn,
    $t whereNotIn,
       ) {
$CompileTimeError
       }
      $queryClassName orderBy_$name({bool descending = false}) {
$CompileTimeError
      }
      """;
    } else {}
    return "";
  }).toList();
  var docClass = "";
  var pDocField = "";
  print("subCollection Fields $subCollectionFields");
  if (subCollectionFields.isNotEmpty) {
    final docName = "${name}QueryDoc";
    final docFields = subCollectionFields.map((f) {
      final col = f.type.element?.collectionAnnotation;
      final name = "${col!.name}_${f.type}";
      return "${name}Query ${f.name}_${f.type}subcol() { $CompileTimeError }";
    }).join("\n");
    docClass = """
      class $docName {
        $docFields
      }
    """;
    pDocField = "$docName doc(String id) { throw Error();}";
  }

  return """
   
   class $queryClassName {
      ${genericQueryFields.join("\n")}
      ${fields.join("\n")}
      $pDocField
   }
  
   $docClass
  """;
}

//  final List<Security>? rules; // global rules
//   final String rulesPath;
FireStoreSchema getFireStoreSchemaFromAnnotation(ClassElement element) {
  final annot = element.annotationFromType(FireStoreSchema)!;
  final obj = annot.computeConstantValue();
  if (obj == null) {
    throw ArgumentError.value(
        "Error in evaluating annotation make sure you used all constant values");
  }
  final reader = ConstantReader(obj);
  final rulesPath = reader.peek("rulesPath")?.stringValue;
  if (rulesPath == null) {
    throw ArgumentError.value(
        "rulesPath is a required field , please provide it");
  }
  final rules = reader
      .peek("rules")
      ?.listValue
      .map((e) => convertDartObjectToSecurity(e))
      .toList();

  return FireStoreSchema(rulesPath: rulesPath, rules: rules);
}
