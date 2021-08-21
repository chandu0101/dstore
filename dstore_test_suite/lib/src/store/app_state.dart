import 'package:dstore/dstore.dart';
import 'package:dstore_middleware_http/middleware_http.dart';
import 'package:dstore_middleware_websocket/middleware_websocket.dart';
import 'package:dstore_test/dstore_test.dart';
import 'package:dstore_test_suite/src/store/pstates/http/simple_http_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/books_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/setings_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/tabs_nav.dart';
import 'package:dstore_test_suite/src/store/pstates/selectors/simple_flutter_selectors.dart';
import 'package:dstore_test_suite/src/store/pstates/selectors/simple_selector_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_async_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_form_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_history_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_persist2.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_persist3_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_persist_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_persitance_migratorps.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/stream/simple_stream_ps.dart';
import 'package:dstore_test_suite/src/store/pstates/websocket/websocket_ps.dart';

part "app_state.dstore.dart";

@AppStateAnnotation()
void $_AppState(
    Simple simple,
    SimpleAsync simpleAsync,
    SimpleHistory simpleHistory,
    SimplePersist simplePersist,
    SimplePersist2 simplePersist2,
    SimplePersist3 simplePersist3,
    SimplePersitanceMigrator simplePersitanceMigrator,
    SimpleHttp simpleHttp,
    SimpleWebsocket simpleWebsocket,
    SimpleStreamPS streamPS,
    SimpleFlutterSelectors simpleFlutterSelector,
    SimpleSelectorPS simpleSelectorPS,
    SimpleFormPS simpleFormPS,
    SimpleNavPS simpleNavPS,
    BooksNav booksNav,
    SettingsNav settingsNav,
    TabsNestedStack tabsNested,
    TabsNestedStack_Nested tabsNested_Nested) {}

final networkListener = TempNetworkStatusListener();

final store = createStore(
    handleError: (error) {
      print("Uncaught error in store  $error");
    },
    middlewares: [
      tempOfflineMiddleware,
      formMiddleware,
      createHttpMiddleware<AppState>(),
      createWebsocketMiddleware()
    ],
    networkOptions: NetworkOptions(statusListener: networkListener),
    storageOptions: StorageOptions(
      storage: InMemoryStorage(initialValues: <String, dynamic>{
        "$simplePersistTypeName": {"x": 1},
        // "$simplePersist2TypeName": {"y": 2},
        "$simplePersistMigratorTypename": {"name": 1}
      }, errorKeys: [
        simplePersist2TypeName,
        simplePersist3TypeName
      ]),
      onWriteError: (error, store, action) async {
        print("storage write error $error action $action");
        if (action.type == simplePersist3TypeName) {
          return StorageWriteErrorAction.revert_state_changes;
        }
        return StorageWriteErrorAction.ignore;
      },
      onReadError: (dynamic error) {
        print("Storage Read error $error");
      },
    ));

final storeTester = StoreTester(store: store, waitForStorage: true);
