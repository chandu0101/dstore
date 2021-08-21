import 'package:dstore_generator/src/graphql/globals.dart';
import 'package:gql/schema.dart';

abstract class GraphqlAstUtils {
  static TypeDefinition getTypeDefinitionFromGraphqlType(GraphQLType gt) {
    if (gt is NamedType) {
      return gt.type!;
    } else {
      return getTypeDefinitionFromGraphqlType((gt as ListType).type);
    }
  }

  static final alreadyGotObjectQueries = <String, String>{};
  //TODO handle recursive queries
  static String getObjectQuery(
      {required String objectName, required String apiUrl}) {
    final existingValue = graphqlObjectsQueryExpansionMap[apiUrl]?[objectName];
    if (existingValue != null) {
      return existingValue;
    }
    final schema = graphqlSchemaMap[apiUrl]!;
    final td = schema.typeMap[objectName];
    // alreadyGotObjectQueries[objectName] = "TODO";
    var query = convertObjectDefnitionToQueryString(td as ObjectTypeDefinition);
    print("done query $query");
    alreadyGotObjectQueries[objectName] = query;
    print("finalMap $alreadyGotObjectQueries");
    // alreadyGotObjectQueries.forEach((key, value) {
    //   query = query.replaceAll("$key.TODO", value);
    // });
    final existingMap = graphqlObjectsQueryExpansionMap[apiUrl];
    if (existingMap != null) {
      existingMap[objectName] = query;
    } else {
      graphqlObjectsQueryExpansionMap[apiUrl] = {objectName: query};
    }
    print("final query $query");
    return query;
  }

  static String convertObjectDefnitionToQueryString(ObjectTypeDefinition otd) {
    return otd.fields
        .map((e) => convertFieldDefinitionToQueryString(e))
        .join("\n");
  }

  static String convertFieldDefinitionToQueryString(FieldDefinition fd) {
    final name = fd.name;
    final td = getTypeDefinitionFromGraphqlType(fd.type!);
    if (td is ScalarTypeDefinition) {
      return name!;
    } else if (td is ObjectTypeDefinition) {
      print(
          "convertFieldDefinitionToQueryString $name ${fd.type?.baseTypeName}");
      final objName = fd.type?.baseTypeName ?? "";
      if (alreadyGotObjectQueries.containsKey(objName)) {
        print("its already maps");
        return """$name {
              $objName.TODO
          } """;
      }
      // alreadyGotObjectQueries[objName] = "TODO";
      print("geting from gql");
      final result = convertObjectDefnitionToQueryString(td);
      // alreadyGotObjectQueries[objName] = result;
      return """$name {
             ${result}
          } """;
    } else if (td is UnionTypeDefinition) {
      final uName = "";
      if (alreadyGotObjectQueries.containsKey(uName)) {
        return """
          $name {
            ${uName}.TODO
          }
        """;
      }
      // alreadyGotObjectQueries[uName] = "TODO";
      final result = convertUnionTypeDefnitionToQueryString(td);
      // alreadyGotObjectQueries[uName] = result;
      return """
          $name {
            ${result}
          }
        """;
      ;
    } else if (td is InterfaceTypeDefinition) {
      final iName = td.name ?? "";
      if (alreadyGotObjectQueries.containsKey(iName)) {
        return """$name {
              ${iName}.TODO
          } """;
      }
      // alreadyGotObjectQueries[iName] = "TODO";
      final result = convertInterfaceTypeDefinitionToQueryString(td);
      // alreadyGotObjectQueries[iName] = result;
      return """
          $name {
            ${result}
          }
        """;
    } else {
      return "";
    }
  }

  static String convertUnionTypeDefnitionToQueryString(UnionTypeDefinition ud) {
    final frags = ud.types.map((e) {
      return """
       ... on ${e.name} {
         ${convertObjectDefnitionToQueryString(e)}
       }
      """;
    }).join("\n");
    return """
       __typename
       $frags
     """;
  }

  static String convertInterfaceTypeDefinitionToQueryString(
      InterfaceTypeDefinition id) {
    final fields =
        id.fields.map((e) => convertFieldDefinitionToQueryString(e)).join("\n");
    //  final frags = id. //TODO may be get concrete types ?
    return """
     $fields
     __typename

    """;
  }
}
