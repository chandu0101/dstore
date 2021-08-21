import 'dart:io';

import 'package:dstore/dstore.dart';
// part 'dgraph.dstore.dart';

// @GraphqlSchemaSource(
//     path: "./schemas/sources/dgraph_learn.graphql",
//     database: GraphqlDatabase.dgraph,
//     schemaUplodDetails: SchemaUploadRequest(
//         url: "https://proud-dew.ap-south-1.aws.cloud.dgraph.io/admin/schema"))
// class LearnSchema {
//   late Objects objects;
// }

enum Enum1 { h }

abstract class Node {
  late ID id;
}

abstract class Task implements Node {
  late String text;
  late bool completed;
}

abstract class Objects implements Task {}
