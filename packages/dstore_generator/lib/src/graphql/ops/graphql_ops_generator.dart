import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/graphql/globals.dart';
import 'package:dstore_generator/src/graphql/ops/gql_visitors.dart';
import 'package:dstore_generator/src/graphql/ops/typegen.dart';
import 'package:dstore_generator/src/graphql/ops/visitors.dart';
import 'package:dstore_generator/src/graphql/schema/schema_genrator.dart';
import 'package:dstore_generator/src/utils/crypto_utils.dart';
import 'package:dstore_generator/src/utils/utils.dart';
import 'package:gql/ast.dart';
import 'package:gql/schema.dart';
import 'package:source_gen/source_gen.dart';

class GraphqlOpsGenerator extends GeneratorForAnnotation<GraphqlOps> {
  @override
  Future<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    try {
      if (!(element is ClassElement)) {
        throw Exception(
            "Graphqlops annotation should should only be applied on abstract classes");
      }
      final name = element.name;
      print("OpsName $name fields ${element.fields}");
      element.fields.forEach((f) {
        print("${f.name} ${f.isStatic} ${f.isConst}");
      });
      final opsAnnotations = element.metadata.first.computeConstantValue();
      final apiA = opsAnnotations?.getField("api")!;
      final gAPi = getGraphqlApi(apiA);

      final apiUrl = gAPi.apiUrl;
      if (graphqlSchemaMap[apiUrl] == null) {
        await getGraphqlSchemaFromApiUrl(gAPi);
      }

      final visitor = DSLFieldsVisitor(
          className: element.name, element: element, api: gAPi);
      final ast = await AstUtils.getAstNodeFromElement(element, buildStep);
      ast.visitChildren(visitor);
      final ops = visitor.ops.join("\n");
      return """
     $ops
    """;
    } catch (e, st) {
      logger.error("Error in generate GraphqlOps for ${element.name}", e, st);
      rethrow;
    }
  }
}

String generateOpsTypeForQuery({
  required GraphQLSchema schema,
  required String query,
  required DocumentNode doc,
  required GraphqlApi api,
  required String name,
}) {
  final visitor = OperationVisitor(documentNode: doc, schema: schema, api: api);
  doc.accept(visitor);
  final types = getTypes(visitor, name, api.collectionEquality);
  query = query.trim();
  var result = "";
  final gq = "\"\"\"${query.replaceAll("\$", "\\\$")}\"\"\"";
  String? hash;
  var useGetPersitant = false;
  if (api.enablePersitantQueries != null) {
    hash = CryptoUtils.getSHA256Hash(query);
    useGetPersitant = api.enablePersitantQueries == PersitantQueryMode.GET;
  }
  final graphqlQuery = GraphqlRequestPart(
      query: gq,
      hash: hash != null ? '"$hash"' : null,
      useGetForPersist: useGetPersitant);
  final responseType = "${name}Data";
  final responseSerializer = "${responseType}Serializer";
  final responserDeserializer = "${responseType}Deserializer";
  final responseSerializerFn = """
      
      Map<String,dynamic> $responseSerializer(int status,$responseType resp) => resp.toJson();
    
    """;

  final responseDeserializerFunction = """
      $responseType $responserDeserializer(int status,dynamic json) => $responseType.fromJson(json as Map<String,dynamic>);
    """;
  final inputSerilizer = "GraphqlRequestInput.toJson";
  final inputDeserializer = "${name}InputDeserializer";

  var inputDeserializerFn = "";
  final variablesName = "${name}Variables";
  final inputType =
      "GraphqlRequestInput${visitor.variables.isNotEmpty ? "<$variablesName>" : "<Null>"}";
  if (visitor.variables.isNotEmpty) {
    inputDeserializerFn = """        
        $inputType $inputDeserializer(dynamic json) {
             json = json as Map<String,dynamic>;
             final variables = $variablesName.fromJson(json["variables"] as Map<String,dynamic>);
             return GraphqlRequestInput.fromJson(json,variables:variables);
        }
      """;
  } else {
    inputDeserializerFn = """        
        $inputType $inputDeserializer(dynamic json) {
             return GraphqlRequestInput.fromJson(json as Map<String,dynamic>);
        }
      """;
  }

  if (visitor.opType == OperationType.query ||
      visitor.opType == OperationType.mutation) {
    final req = """
   @HttpRequest(
    method: "POST",
    url: "${api.apiUrl}",
    graphqlQuery: $graphqlQuery,
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type":"applications/josn"},
    responseSerializer : $responseSerializer,
    inputSerializer: $inputSerilizer,
    inputDeserializer: $inputDeserializer,
    responseDeserializer: $responserDeserializer)
  """;
    result = """
    $types    
    $inputDeserializerFn
    $responseSerializerFn
    $responseDeserializerFunction
    $req
    typedef $name = HttpField<$inputType, $responseType, List<GraphqlError>>;

    $req
    typedef ${name}T<T> = HttpField<$inputType, T, List<GraphqlError>>;
  """;
  } else {
    // subscription
    if (api.wsUrl == null) {
      throw ArgumentError.value(
          "You should provide websocket url in u r GraphqlApi config inorder to use subscriptions ");
    }
    final responseDeserializerFunction = """
      $responseType $responserDeserializer(dynamic value) => $responseType.fromJson(value as Map<String,dynamic>);
    """;
    final req = """
   @WebSocketRequest(
    url: "${api.wsUrl}",
    graphqlQuery: $graphqlQuery,
    inputSerializer: $inputSerilizer,
    responseDeserializer: $responserDeserializer)
  """;
    result = """
    $types    
    $responseDeserializerFunction
    $req
    typedef ${name} = WebSocketField<$inputType, $responseType, List<GraphqlError>>;

  """;
  }

  return result;
}
