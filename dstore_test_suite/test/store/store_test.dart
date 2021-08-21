import 'dart:async';

import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:test/test.dart';
import "./pstates/async_methods.dart" as asyncmethods;
import "./pstates/sync_methods.dart" as syncmethods;
import "./pstates/history_pstate.dart" as historypstate;
import "./pstates/perssit_pstate.dart" as persistpstate;
import "./pstates/http_pstate.dart" as httppstate;
import "./pstates/http_pstate_http.dart" as httppstate_http;
import "./pstates/websocket_pstate.dart" as websocketpstate;
import "./pstates/stream_pstate.dart" as streampstate;
import "./selectors/app_selectors.dart" as simpleselctor;
import "./api/graphql/schema.dart" as graphqlschema;
import "./database/firebase.dart" as firebaseschema;

void main() {
  setUpAll(() async {
    if (store.isReady) {
      return;
    }
    final f = Completer<dynamic>();
    store.listenForReadyState((error, st) {
      if (error == null) {
        print("store is ready");
        f.complete();
      } else {
        print("StoreReadyError $error St $st");
        // throw Exception("Store init failed");
        f.completeError(error, st as StackTrace);
      }
    });
    return f.future;
  });
  print("executing tests");

  // asyncmethods.main();
  // syncmethods.main();
  // historypstate.main();
  // persistpstate.main();
  // httppstate.main();
  simpleselctor.main();
  // websocketpstate.main();
  // streampstate.main();
  // graphqlschema.main();
  // firebaseschema.main();
  // httppstate_http.main();
  group('Store tests', () {
    test("should get appVersion from pubspec", () {
      expect(store.appVersion, "1.0.0");
    });
    test("should contain meta for all state fields", () {
      final stateKeys = store.state.toMap().keys;
      expect(store.internalMeta.keys, stateKeys);
    });
  });
}
