// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_ps.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

@immutable
class Simple extends PStateModel<Simple> {
  final int count;

  final String name;

  final String personType;

  final bool coolGeek;

  final bool areYouSafeOnThisPlant;

  final List<String> riversToVisit;

  final bool listeningonLoop;

  final bool general;

  @RegularMethod()
  String processName(String name) => "AkandaBharath";

  _$SimpleCopyWith<Simple> get copyWith =>
      __$SimpleCopyWithImpl<Simple>(this, IdentityFn);

  Simple(
      {this.count = 0,
      this.name = "",
      this.personType = "",
      this.coolGeek = false,
      this.areYouSafeOnThisPlant = false,
      this.riversToVisit = const [],
      this.listeningonLoop = false,
      this.general = false});

  @override
  Simple copyWithMap(Map<String, dynamic> map) => Simple(
      count: map.containsKey("count") ? map["count"] as int : this.count,
      name: map.containsKey("name") ? map["name"] as String : this.name,
      personType: map.containsKey("personType")
          ? map["personType"] as String
          : this.personType,
      coolGeek:
          map.containsKey("coolGeek") ? map["coolGeek"] as bool : this.coolGeek,
      areYouSafeOnThisPlant: map.containsKey("areYouSafeOnThisPlant")
          ? map["areYouSafeOnThisPlant"] as bool
          : this.areYouSafeOnThisPlant,
      riversToVisit: map.containsKey("riversToVisit")
          ? map["riversToVisit"] as List<String>
          : this.riversToVisit,
      listeningonLoop: map.containsKey("listeningonLoop")
          ? map["listeningonLoop"] as bool
          : this.listeningonLoop,
      general:
          map.containsKey("general") ? map["general"] as bool : this.general);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "count": this.count,
        "name": this.name,
        "personType": this.personType,
        "coolGeek": this.coolGeek,
        "areYouSafeOnThisPlant": this.areYouSafeOnThisPlant,
        "riversToVisit": this.riversToVisit,
        "listeningonLoop": this.listeningonLoop,
        "general": this.general
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Simple &&
        o.count == count &&
        o.name == name &&
        o.personType == personType &&
        o.coolGeek == coolGeek &&
        o.areYouSafeOnThisPlant == areYouSafeOnThisPlant &&
        o.riversToVisit == riversToVisit &&
        o.listeningonLoop == listeningonLoop &&
        o.general == general;
  }

  @override
  int get hashCode =>
      count.hashCode ^
      name.hashCode ^
      personType.hashCode ^
      coolGeek.hashCode ^
      areYouSafeOnThisPlant.hashCode ^
      riversToVisit.hashCode ^
      listeningonLoop.hashCode ^
      general.hashCode;

  @override
  String toString() =>
      "Simple(count: ${this.count}, name: ${this.name}, personType: ${this.personType}, coolGeek: ${this.coolGeek}, areYouSafeOnThisPlant: ${this.areYouSafeOnThisPlant}, riversToVisit: ${this.riversToVisit}, listeningonLoop: ${this.listeningonLoop}, general: ${this.general})";
}

abstract class $SimpleCopyWith<O> {
  factory $SimpleCopyWith(Simple value, O Function(Simple) then) =
      _$SimpleCopyWithImpl<O>;
  O call(
      {int count,
      String name,
      String personType,
      bool coolGeek,
      bool areYouSafeOnThisPlant,
      List<String> riversToVisit,
      bool listeningonLoop,
      bool general});
}

class _$SimpleCopyWithImpl<O> implements $SimpleCopyWith<O> {
  final Simple _value;
  final O Function(Simple) _then;
  _$SimpleCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? count = dimmutable,
      Object? name = dimmutable,
      Object? personType = dimmutable,
      Object? coolGeek = dimmutable,
      Object? areYouSafeOnThisPlant = dimmutable,
      Object? riversToVisit = dimmutable,
      Object? listeningonLoop = dimmutable,
      Object? general = dimmutable}) {
    return _then(_value.copyWith(
        count: count == dimmutable ? _value.count : count as int,
        name: name == dimmutable ? _value.name : name as String,
        personType:
            personType == dimmutable ? _value.personType : personType as String,
        coolGeek: coolGeek == dimmutable ? _value.coolGeek : coolGeek as bool,
        areYouSafeOnThisPlant: areYouSafeOnThisPlant == dimmutable
            ? _value.areYouSafeOnThisPlant
            : areYouSafeOnThisPlant as bool,
        riversToVisit: riversToVisit == dimmutable
            ? _value.riversToVisit
            : riversToVisit as List<String>,
        listeningonLoop: listeningonLoop == dimmutable
            ? _value.listeningonLoop
            : listeningonLoop as bool,
        general: general == dimmutable ? _value.general : general as bool));
  }
}

abstract class _$SimpleCopyWith<O> implements $SimpleCopyWith<O> {
  factory _$SimpleCopyWith(Simple value, O Function(Simple) then) =
      __$SimpleCopyWithImpl<O>;
  O call(
      {int count,
      String name,
      String personType,
      bool coolGeek,
      bool areYouSafeOnThisPlant,
      List<String> riversToVisit,
      bool listeningonLoop,
      bool general});
}

class __$SimpleCopyWithImpl<O> extends _$SimpleCopyWithImpl<O>
    implements _$SimpleCopyWith<O> {
  __$SimpleCopyWithImpl(Simple _value, O Function(Simple) _then)
      : super(_value, (v) => _then(v));

  @override
  Simple get _value => super._value;

  @override
  O call(
      {Object? count = dimmutable,
      Object? name = dimmutable,
      Object? personType = dimmutable,
      Object? coolGeek = dimmutable,
      Object? areYouSafeOnThisPlant = dimmutable,
      Object? riversToVisit = dimmutable,
      Object? listeningonLoop = dimmutable,
      Object? general = dimmutable}) {
    return _then(Simple(
        count: count == dimmutable ? _value.count : count as int,
        name: name == dimmutable ? _value.name : name as String,
        personType:
            personType == dimmutable ? _value.personType : personType as String,
        coolGeek: coolGeek == dimmutable ? _value.coolGeek : coolGeek as bool,
        areYouSafeOnThisPlant: areYouSafeOnThisPlant == dimmutable
            ? _value.areYouSafeOnThisPlant
            : areYouSafeOnThisPlant as bool,
        riversToVisit: riversToVisit == dimmutable
            ? _value.riversToVisit
            : riversToVisit as List<String>,
        listeningonLoop: listeningonLoop == dimmutable
            ? _value.listeningonLoop
            : listeningonLoop as bool,
        general: general == dimmutable ? _value.general : general as bool));
  }
}

const _Simple_FullPath = "/store/pstates/simple_ps/Simple";

class SimpleIncrmentResult implements ToMap<SimpleIncrmentResult> {
  final int? count;

  const SimpleIncrmentResult({this.count});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (count != null) {
      map["count"] = count;
    }

    return map;
  }

  @override
  SimpleIncrmentResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

class SimpleSetNameResult implements ToMap<SimpleSetNameResult> {
  final String? name;

  const SimpleSetNameResult({this.name});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (name != null) {
      map["name"] = name;
    }

    return map;
  }

  @override
  SimpleSetNameResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

class SimpleSetPersonTypeResult implements ToMap<SimpleSetPersonTypeResult> {
  final String? personType;

  const SimpleSetPersonTypeResult({this.personType});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (personType != null) {
      map["personType"] = personType;
    }

    return map;
  }

  @override
  SimpleSetPersonTypeResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

class SimpleAreYouCoolGeekResult implements ToMap<SimpleAreYouCoolGeekResult> {
  final bool? coolGeek;

  const SimpleAreYouCoolGeekResult({this.coolGeek});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (coolGeek != null) {
      map["coolGeek"] = coolGeek;
    }

    return map;
  }

  @override
  SimpleAreYouCoolGeekResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

class SimpleAreYouWantToVisitTheseRiversResult
    implements ToMap<SimpleAreYouWantToVisitTheseRiversResult> {
  final List<String>? riversToVisit;

  const SimpleAreYouWantToVisitTheseRiversResult({this.riversToVisit});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (riversToVisit != null) {
      map["riversToVisit"] = riversToVisit;
    }

    return map;
  }

  @override
  SimpleAreYouWantToVisitTheseRiversResult copyWithMap(
          Map<String, dynamic> map) =>
      throw UnimplementedError();
}

class SimpleDidYouVisitedAkandaBharathResult
    implements ToMap<SimpleDidYouVisitedAkandaBharathResult> {
  final bool? areYouSafeOnThisPlant;

  const SimpleDidYouVisitedAkandaBharathResult({this.areYouSafeOnThisPlant});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (areYouSafeOnThisPlant != null) {
      map["areYouSafeOnThisPlant"] = areYouSafeOnThisPlant;
    }

    return map;
  }

  @override
  SimpleDidYouVisitedAkandaBharathResult copyWithMap(
          Map<String, dynamic> map) =>
      throw UnimplementedError();
}

class SimpleIsHeListeningOnLoopResult
    implements ToMap<SimpleIsHeListeningOnLoopResult> {
  final bool? listeningonLoop;

  const SimpleIsHeListeningOnLoopResult({this.listeningonLoop});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (listeningonLoop != null) {
      map["listeningonLoop"] = listeningonLoop;
    }

    return map;
  }

  @override
  SimpleIsHeListeningOnLoopResult copyWithMap(Map<String, dynamic> map) =>
      throw UnimplementedError();
}

class SimpleShouldHandleGeneralStatementResult
    implements ToMap<SimpleShouldHandleGeneralStatementResult> {
  final bool? general;

  const SimpleShouldHandleGeneralStatementResult({this.general});
  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (general != null) {
      map["general"] = general;
    }

    return map;
  }

  @override
  SimpleShouldHandleGeneralStatementResult copyWithMap(
          Map<String, dynamic> map) =>
      throw UnimplementedError();
}

abstract class SimpleActions {
  static Action<SimpleIncrmentResult> incrment({bool silent = false}) {
    return Action<SimpleIncrmentResult>(
        name: "incrment",
        silent: silent,
        type: _Simple_FullPath,
        isAsync: false);
  }

  static Action<SimpleIncrmentResult> incrmentMock(SimpleIncrmentResult mock) {
    return Action<SimpleIncrmentResult>(
        name: "incrment", type: _Simple_FullPath, mock: mock);
  }

  static Action<SimpleSetNameResult> setName(
      {required String newName, bool silent = false}) {
    return Action<SimpleSetNameResult>(
        name: "setName",
        silent: silent,
        type: _Simple_FullPath,
        payload: <String, dynamic>{
          "newName": newName,
        },
        isAsync: false);
  }

  static Action<SimpleSetNameResult> setNameMock(SimpleSetNameResult mock) {
    return Action<SimpleSetNameResult>(
        name: "setName", type: _Simple_FullPath, mock: mock);
  }

  static Action<SimpleSetPersonTypeResult> setPersonType(
      {required bool wentToSriSailam, bool silent = false}) {
    return Action<SimpleSetPersonTypeResult>(
        name: "setPersonType",
        silent: silent,
        type: _Simple_FullPath,
        payload: <String, dynamic>{
          "wentToSriSailam": wentToSriSailam,
        },
        isAsync: false);
  }

  static Action<SimpleSetPersonTypeResult> setPersonTypeMock(
      SimpleSetPersonTypeResult mock) {
    return Action<SimpleSetPersonTypeResult>(
        name: "setPersonType", type: _Simple_FullPath, mock: mock);
  }

  static Action<SimpleAreYouCoolGeekResult> areYouCoolGeek(
      {required bool didYouWatchedHBOSiliconValley, bool silent = false}) {
    return Action<SimpleAreYouCoolGeekResult>(
        name: "areYouCoolGeek",
        silent: silent,
        type: _Simple_FullPath,
        payload: <String, dynamic>{
          "didYouWatchedHBOSiliconValley": didYouWatchedHBOSiliconValley,
        },
        isAsync: false);
  }

  static Action<SimpleAreYouCoolGeekResult> areYouCoolGeekMock(
      SimpleAreYouCoolGeekResult mock) {
    return Action<SimpleAreYouCoolGeekResult>(
        name: "areYouCoolGeek", type: _Simple_FullPath, mock: mock);
  }

  static Action<SimpleAreYouWantToVisitTheseRiversResult>
      areYouWantToVisitTheseRivers(
          {required List<String> newRivers, bool silent = false}) {
    return Action<SimpleAreYouWantToVisitTheseRiversResult>(
        name: "areYouWantToVisitTheseRivers",
        silent: silent,
        type: _Simple_FullPath,
        payload: <String, dynamic>{
          "newRivers": newRivers,
        },
        isAsync: false);
  }

  static Action<SimpleAreYouWantToVisitTheseRiversResult>
      areYouWantToVisitTheseRiversMock(
          SimpleAreYouWantToVisitTheseRiversResult mock) {
    return Action<SimpleAreYouWantToVisitTheseRiversResult>(
        name: "areYouWantToVisitTheseRivers",
        type: _Simple_FullPath,
        mock: mock);
  }

  static Action<SimpleDidYouVisitedAkandaBharathResult>
      didYouVisitedAkandaBharath({required bool answer, bool silent = false}) {
    return Action<SimpleDidYouVisitedAkandaBharathResult>(
        name: "didYouVisitedAkandaBharath",
        silent: silent,
        type: _Simple_FullPath,
        payload: <String, dynamic>{
          "answer": answer,
        },
        isAsync: false);
  }

  static Action<SimpleDidYouVisitedAkandaBharathResult>
      didYouVisitedAkandaBharathMock(
          SimpleDidYouVisitedAkandaBharathResult mock) {
    return Action<SimpleDidYouVisitedAkandaBharathResult>(
        name: "didYouVisitedAkandaBharath", type: _Simple_FullPath, mock: mock);
  }

  static Action<SimpleIsHeListeningOnLoopResult> isHeListeningOnLoop(
      {required String songCategory, bool silent = false}) {
    return Action<SimpleIsHeListeningOnLoopResult>(
        name: "isHeListeningOnLoop",
        silent: silent,
        type: _Simple_FullPath,
        payload: <String, dynamic>{
          "songCategory": songCategory,
        },
        isAsync: false);
  }

  static Action<SimpleIsHeListeningOnLoopResult> isHeListeningOnLoopMock(
      SimpleIsHeListeningOnLoopResult mock) {
    return Action<SimpleIsHeListeningOnLoopResult>(
        name: "isHeListeningOnLoop", type: _Simple_FullPath, mock: mock);
  }

  static Action<SimpleShouldHandleGeneralStatementResult>
      shouldHandleGeneralStatement({bool silent = false}) {
    return Action<SimpleShouldHandleGeneralStatementResult>(
        name: "shouldHandleGeneralStatement",
        silent: silent,
        type: _Simple_FullPath,
        isAsync: false);
  }

  static Action<SimpleShouldHandleGeneralStatementResult>
      shouldHandleGeneralStatementMock(
          SimpleShouldHandleGeneralStatementResult mock) {
    return Action<SimpleShouldHandleGeneralStatementResult>(
        name: "shouldHandleGeneralStatement",
        type: _Simple_FullPath,
        mock: mock);
  }
}

dynamic Simple_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as Simple;
  final name = _DstoreAction.name;
  switch (name) {
    case "incrment":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        var _DStore_count = _DStoreState.count;
        _DStore_count += 1;
        return _DStoreState.copyWith(count: _DStore_count);
      }

    case "setName":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final newName = _DstoreActionPayload["newName"] as String;

        var _DStore_name = _DStoreState.name;
        _DStore_name = _DStoreState.processName(newName);
        return _DStoreState.copyWith(name: _DStore_name);
      }

    case "setPersonType":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final wentToSriSailam = _DstoreActionPayload["wentToSriSailam"] as bool;

        var _DStore_personType = _DStoreState.personType;
        if (wentToSriSailam) {
          _DStore_personType = "Good";
        } else {
          _DStore_personType = "Hmmm";
        }

        return _DStoreState.copyWith(personType: _DStore_personType);
      }

    case "areYouCoolGeek":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final didYouWatchedHBOSiliconValley =
            _DstoreActionPayload["didYouWatchedHBOSiliconValley"] as bool;

        var _DStore_coolGeek = _DStoreState.coolGeek;
        if (didYouWatchedHBOSiliconValley) {
          _DStore_coolGeek = true;
        }

        return _DStoreState.copyWith(coolGeek: _DStore_coolGeek);
      }

    case "areYouWantToVisitTheseRivers":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final newRivers = _DstoreActionPayload["newRivers"] as List<String>;

        var _DStore_riversToVisit = _DStoreState.riversToVisit;
        final result = <String>[];
        newRivers.forEach((element) {
          result.add(element);
        });
        _DStore_riversToVisit = [..._DStoreState.riversToVisit, ...result];
        return _DStoreState.copyWith(riversToVisit: _DStore_riversToVisit);
      }

    case "didYouVisitedAkandaBharath":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final answer = _DstoreActionPayload["answer"] as bool;

        var _DStore_areYouSafeOnThisPlant = _DStoreState.areYouSafeOnThisPlant;
        if (answer) {
          try {
            throw Exception();
          } catch (e) {
            _DStore_areYouSafeOnThisPlant = true;
          }
        } else {
          throw Exception();
        }

        return _DStoreState.copyWith(
            areYouSafeOnThisPlant: _DStore_areYouSafeOnThisPlant);
      }

    case "isHeListeningOnLoop":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final songCategory = _DstoreActionPayload["songCategory"] as String;

        var _DStore_listeningonLoop = _DStoreState.listeningonLoop;
        if (songCategory == "NamaSivaya") {
          for (var i = 0; i < 5; i++) {
            _DStore_listeningonLoop = true;
          }
        }

        return _DStoreState.copyWith(listeningonLoop: _DStore_listeningonLoop);
      }

    case "shouldHandleGeneralStatement":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        var _DStore_general = _DStoreState.general;
        print("sleeping ");
        print("eating");
        final list = <String>["one", "two"];
        print(list.map((e) => e.toUpperCase()));
        _DStore_general = true;
        return _DStoreState.copyWith(general: _DStore_general);
      }

    default:
      {
        return _DStoreState;
      }
  }
}

Simple Simple_DS() => Simple(
    count: 0,
    name: "",
    personType: "",
    coolGeek: false,
    areYouSafeOnThisPlant: false,
    riversToVisit: [],
    listeningonLoop: false,
    general: false);

final SimpleMeta = PStateMeta<Simple>(
    type: _Simple_FullPath, reducer: Simple_SyncReducer, ds: Simple_DS);
