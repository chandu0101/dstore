import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/api/graphql/dgraph/enums.dart';
import 'package:dstore_test_suite/src/store/api/graphql/dgraph/inputs.dart';
import 'package:dstore_test_suite/src/store/api/graphql/dgraph/interfaces.dart';
import 'package:dstore_test_suite/src/store/api/graphql/dgraph/objects.dart';

@GraphqlSchemaSource(path: "./dgrpah.graphql", database: GraphqlDatabase.dgraph)
class DGraphSchema {
  late Objects objects;
  late Inputs inputs;
  late Interfaces interfaces;
  late Unions unions;
  late Enums enums;
}
