import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/api/graphql/local.dart';
part "local_ops.api.dstore.dart";
part "local_ops.g.dart";

final s = "23";

@GraphqlOps(localAPi, revision: "1.2")
abstract class LocalGraphqlOps {
  static final ping = Query()..ping();
  static final users = Query()..users(Person());
  static final chnageNameWithVariables = Mutation("\$name: String!")
    ..changeName(name: "\$name");
  static final addMessage = Mutation()..addMessage(Message(), message: "m1");
  static final errorQ = Query()..errorQ();
  // static final subscription = Subscription()..messageAdded();
  static final subscriptionMessage = Subscription()..messageCreated(Message());
}
