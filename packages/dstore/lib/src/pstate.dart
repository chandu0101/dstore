import 'dart:async';
import 'dart:collection';

import 'package:dstore/dstore.dart';
import 'package:dstore/src/action.dart';
import 'package:json_annotation/json_annotation.dart';
part "pstate.dstore.dart";
part 'pstate.g.dart';

typedef ReducerFn = dynamic Function(dynamic state, Action action);

typedef AReducerFn = Future<dynamic> Function(dynamic state, Action action);

@DImmutable(isJsonSerializable: true)
class $_AsyncActionField {
  bool loading = false;
  bool completed = false;
  dynamic? error;
}

abstract class PStateModel<M> {
  M copyWithMap(Map<String, dynamic> map);
  Map<String, dynamic> toMap();
}

mixin PStateStoreDepsMixin {
  Store<dynamic>? _dont_touch_me_store;
  Store<dynamic> get dontTouchMeStore => _dont_touch_me_store!;
  void dontTouchMeStore2(Store<dynamic>? s) {
    _dont_touch_me_store = s;
  }
}

class PStateStorageMeta<S extends PStateModel<S>, SM> {
  final dynamic Function(dynamic) serializer;
  final S Function(dynamic) deserializer;
  final bool encryptonRest;
  final PStatePersitMigratorFn? migrator;

  const PStateStorageMeta(
      {this.encryptonRest = false,
      required this.serializer,
      this.migrator,
      required this.deserializer});
}

class PStateMeta<S extends PStateModel<S>> {
  final String type;
  final ReducerFn? reducer;
  final AReducerFn? aReducer;
  final List<String>? psDeps;

  final Map<String, HttpMeta>? httpMetaMap;
  final Map<String, List<String>>? actionsMeta;
  final S Function() ds;

  final PStateStorageMeta<S, dynamic>? sm;
  final bool enableHistory;

  // final int? historyLimit;

  const PStateMeta(
      {this.aReducer,
      this.sm,
      this.psDeps,
      required this.type,
      this.actionsMeta,
      this.httpMetaMap,
      this.enableHistory = false,
      this.reducer,
      required this.ds});
}

class PStateHistory<S extends PStateModel<S>> {
  final Queue<Map<String, dynamic>> _history = ListQueue();
  final Queue<Map<String, dynamic>> _redos = ListQueue();
  final int? limit;
  PStateHistory(this.limit);

  void internalAdd(Map<String, dynamic> patch) {
    if (limit != null && limit! <= 0) {
      throw ArgumentError.value("limit should be more than 0");
    }
    _history.addLast(patch);
    _redos.clear();

    if (limit != null && _history.length > limit!) {
      _history.removeFirst();
    }
  }

  void internalClear() {
    _history.clear();
    _redos.clear();
  }

  S? internalRedo(S currentState) {
    if (canRedo) {
      final patch = _redos.removeFirst();
      print("pacth $patch");
      _history.addLast(patch);
      final newState = currentState.copyWithMap(patch) as PStateHistoryMixin;
      print("newState after redo $newState");
      newState._psHistory = this;
      return newState as S;
    }
  }

  S? internalUndo(S initialState) {
    if (canUndo) {
      final patch = _history.removeLast();
      _redos.addFirst(patch);
      if (_history.isEmpty) {
        return initialState;
      } else {
        final map = <String, dynamic>{};
        _history.forEach((patch) {
          map.addAll(patch);
        });
        final newState = initialState.copyWithMap(patch) as PStateHistoryMixin;
        newState._psHistory = this;
        return newState as S;
      }
    }
  }

  bool get canRedo => _redos.isNotEmpty;
  bool get canUndo => _history.isNotEmpty;
}

mixin PStateHistoryMixin<S extends PStateModel<S>> {
  PStateHistory<S>? _psHistory;
  PStateHistory<S> get dontTouchMePSHistory => _psHistory!;
  set dontTouchMePSHistory(PStateHistory<S> value) {
    _psHistory = value;
  }

}
