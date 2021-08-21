import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/stream/simple_stream_ps.dart';
import 'package:test/test.dart';
import "package:time/time.dart";

// test unsubscribe
// test error on cancel;
void main() {
  Stream<String> errorStream() async* {
    for (var i = 0; i < 5; i++) {
      if (i == 3) {
        throw Exception("Stream errored");
      }
      yield i.toString();
    }
  }

  group("stream pstate", () {
    test("should handle streams", () async {
      final list = ["one", "two", "three"];
      await storeTester.testStreamAction(
          SimpleStreamPSActions.stream1(stream: Stream.fromIterable(list)),
          list);
    });
    //TODO see why exception occuring here
    test("should handle errored stream", () async {
      final list = ["1", "2", "3"];
      // print("error Stream $errorStream()");
      // await storeTester.testStreamAction(
      //     SimpleStreamPSActions.stream1(
      //         stream: errorStream(), cancelOnError: false),
      //     list);
      // errorStream().listen((event) {
      //   print("Got data $event");
      // }, onError: (dynamic e) {
      //   print("Got error $e");
      // }, onDone: () {
      //   print("done");
      // }, cancelOnError: true);

      // await 5.seconds.delay;
    });
  });
}
