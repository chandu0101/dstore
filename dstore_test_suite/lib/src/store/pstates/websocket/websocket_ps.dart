import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/api/graphql/ops/local_ops.dart';
part 'websocket_ps.ps.dstore.dart';

@PState()
class $_SimpleWebsocket {
  LocalGraphqlOps_subscriptionMessage message =
      LocalGraphqlOps_subscriptionMessage();
}
