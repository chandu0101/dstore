import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/http/simple_http_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/websocket/websocket_ps.dart';
import 'package:test/test.dart';
import "package:time/time.dart";

void main() {
  //TODO unsubscribe not triggering
  group("websocket middleware", () {
    test("graphql subscription", () async {
      store.dispatch(SimpleWebsocketActions.message());
      final m1 = SimpleHttpActions.graphqlAddMessage();
      store.dispatch(m1);
      await storeTester.waitForAction(m1);
      final m2 = SimpleHttpActions.graphqlAddMessage();
      store.dispatch(m2);
      await storeTester.waitForAction(m2);
      await 3.seconds.delay;
      store.state.simpleWebsocket.message.internalUnsubscribe!();
      await 3.seconds.delay;
      print("done subscription");
      print(store.state.simpleWebsocket.message.completed);
    });
  });
}
