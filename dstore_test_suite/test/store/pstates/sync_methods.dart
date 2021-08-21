import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_ps.dart';
import 'package:dstore_test_suite/tests.dart';
import 'package:test/test.dart';

void main() {
  group("pstates sync methods", () {
    test("increment", () {
      storeTester.testAction(SimpleActions.incrment(),
          SimpleIncrmentResult(count: store.state.simple.count + 1));
    });
    test("newName", () {
      storeTester.testAction(SimpleActions.setName(newName: "india"),
          SimpleSetNameResult(name: "AkandaBharath"));
    });

    test("setPersonType", () {
      storeTester.testAction(
          SimpleActions.setPersonType(wentToSriSailam: false),
          SimpleSetPersonTypeResult(personType: "Hmm"));
      storeTester.testAction(SimpleActions.setPersonType(wentToSriSailam: true),
          SimpleSetPersonTypeResult(personType: "Good"));
    });

    test("areYouCoolGeek", () {
      storeTester.testAction(
          SimpleActions.areYouCoolGeek(didYouWatchedHBOSiliconValley: false),
          SimpleAreYouCoolGeekResult(coolGeek: false));
      storeTester.testAction(
          SimpleActions.areYouCoolGeek(didYouWatchedHBOSiliconValley: true),
          SimpleAreYouCoolGeekResult(coolGeek: true));
    });

    test("areYouWantToVisitTheseRivers", () {
      final r = ["Krishna", "Godhavari", "Ganga", "Tunga", "Sringeri"];
      storeTester.testAction(
          SimpleActions.areYouWantToVisitTheseRivers(newRivers: r),
          SimpleAreYouWantToVisitTheseRiversResult(riversToVisit: r));
    });

    test("didYouVisitedAkandaBharath", () {
      storeTester.testAction(
          SimpleActions.didYouVisitedAkandaBharath(answer: false),
          SimpleDidYouVisitedAkandaBharathResult(areYouSafeOnThisPlant: false),
          throwsException: true);
      storeTester.testAction(
          SimpleActions.didYouVisitedAkandaBharath(answer: true),
          SimpleDidYouVisitedAkandaBharathResult(areYouSafeOnThisPlant: true));
    });

    test("isHeListeningOnLoop", () {
      storeTester.testAction(
          SimpleActions.isHeListeningOnLoop(songCategory: "Random"),
          SimpleIsHeListeningOnLoopResult(listeningonLoop: false));
      storeTester.testAction(
          SimpleActions.isHeListeningOnLoop(songCategory: "NamaSivaya"),
          SimpleIsHeListeningOnLoopResult(listeningonLoop: true));
    });

    test("shouldHandleGeneralStatement", () {
      storeTester.testAction(SimpleActions.shouldHandleGeneralStatement(),
          SimpleShouldHandleGeneralStatementResult(general: true));
    });
  });
}
