import 'package:dstore/dstore.dart';
import 'package:meta/meta.dart';
part 'simple_ps.ps.dstore.dart';

@PState()
class $_Simple {
  int count = 0;

  String name = "";

  String personType = "";

  bool coolGeek = false;

  bool areYouSafeOnThisPlant = false;

  List<String> riversToVisit = [];

  bool listeningonLoop = false;

  bool general = false;
  //TODO
  // @PSNonConstClassField()
  // Hello h = Hello();

  void incrment() {
    this.count += 1;
  }

  void setName(String newName) {
    this.name = this.processName(newName);
  }

  void setPersonType(bool wentToSriSailam) {
    if (wentToSriSailam) {
      this.personType = "Good";
    } else {
      this.personType = "Hmmm";
    }
  }

  void areYouCoolGeek(bool didYouWatchedHBOSiliconValley) {
    if (didYouWatchedHBOSiliconValley) {
      this.coolGeek = true;
    }
  }

  void areYouWantToVisitTheseRivers(List<String> newRivers) {
    final result = <String>[];
    newRivers.forEach((element) {
      result.add(element);
    });
    this.riversToVisit = [...this.riversToVisit, ...result];
  }

  void didYouVisitedAkandaBharath(bool answer) {
    if (answer) {
      try {
        throw Exception();
      } catch (e) {
        this.areYouSafeOnThisPlant = true;
      }
    } else {
      throw Exception();
    }
  }

  void isHeListeningOnLoop(String songCategory) {
    if (songCategory == "NamaSivaya") {
      for (var i = 0; i < 5; i++) {
        this.listeningonLoop = true;
      }
    }
  }

  void shouldHandleGeneralStatement() {
    print("sleeping ");
    print("eating");
    final list = <String>["one", "two"];
    print(list.map((e) => e.toUpperCase()));
    this.general = true;
  }

  @RegularMethod()
  String processName(String name) => "AkandaBharath";
}

class Hello {}
