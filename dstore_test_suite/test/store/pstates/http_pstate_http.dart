import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/api/openapi/local.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/http/simple_http_ps.dart';
import 'package:test/test.dart';

void main() {
  group("http middleware ", () {
    test("should track downloads", () async {
      await storeTester.testHttpAction(
          SimpleHttpActions.downloadProgress(listenReceiveProgress: true),
          [
            DownloadProgress(loading: true),
            DownloadProgress(
                loading: true, progress: HttpProgress(current: 12, total: 12)),
            DownloadProgress(
              data: [115, 101, 114, 118, 101, 114, 32, 102, 105, 108, 101, 46],
              completed: true,
            ),
          ],
          mapEquals: true);
    });
  });
}
