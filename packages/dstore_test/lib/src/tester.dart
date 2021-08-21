import 'dart:async';

import 'package:async/async.dart';
import 'package:dstore/dstore.dart';
import 'package:flutter_test/flutter_test.dart' hide expect;
import 'package:test/test.dart';

extension on Map<dynamic, dynamic> {
  bool identicalMembers(Map<dynamic, dynamic> other) {
    return this.entries.every((me) => identical(me.value, other[me.key]));
  }
}

class StoreTester<S extends AppStateI<S>> {
  final Store<S> store;
  final queue = <Action>[];
  bool isReady = false;
  StoreTester({required this.store, bool waitForStorage = false}) {
    if (waitForStorage && store.storageOptions != null) {
      isReady = false;
      store.listenForReadyState((error, st) {
        if (error != null) {
          handleReady();
        }
      });
    } else {
      isReady = true;
    }
  }

  S get state => store.state;

  void handleReady() {
    isReady = true;
    queue.forEach((element) {
      dispatch(element);
    });
    queue.clear();
  }

  dynamic dispatch(Action action) {
    if (!isReady) {
      queue.add(action);
    } else {
      store.dispatch(action);
    }
  }

  void testAction<M extends ToMap<dynamic>>(Action<M> action, M result,
      {bool throwsException = false}) {
    final before = store.getPStateModelFromAction(action);
    store.dispatch(action);
    final after = store.getPStateModelFromAction(action);
    expect(identical(before, after), throwsException ? true : false);
    final mockMap = result.toMap();
    if (mockMap.isEmpty) {
      expect(before, after);
    } else {
      final afterMap = after.toMap();
      final beforeMap = before.toMap();
      print("afterMap $afterMap , beforeMap $beforeMap");
      mockMap.forEach((key, dynamic value) {
        expect(value, afterMap[key]);
        beforeMap.remove(key);
      });
      expect(beforeMap.identicalMembers(afterMap), true);
    }
  }

  Future<void> testAsyncAction<M extends ToMap<dynamic>>(
      Action<M> action, M result,
      {Duration? timeout, int interval = 4, AsyncActionField? af}) async {
    assert(action.isAsync == true);
    final before = store.getPStateModelFromAction(action);
    store.dispatch(action);
    if (action.isAsync) {
      await waitForAction(action, timeout: timeout, interval: interval);
    }
    final after = store.getPStateModelFromAction(action);
    expect(identical(before, after), false);
    final mockMap = result.toMap();
    if (mockMap.isEmpty) {
      if (af == null) {
        expect(before, after);
      } else {
        final afterMap = after.toMap();
        final beforeMap = before.toMap();
        expect(afterMap[action.name], af);
        beforeMap.remove(action.name);
        expect(beforeMap.identicalMembers(afterMap), true);
      }
    } else {
      final afterMap = after.toMap();
      final beforeMap = before.toMap();
      mockMap.forEach((key, dynamic value) {
        expect(value, afterMap[key]);
        beforeMap.remove(key);
      });
      if (action.isAsync) {
        beforeMap.remove(action.name);
      }
      expect(beforeMap.identicalMembers(afterMap), true);
    }
  }

  Future<void> testHttpAction<M>(Action<M> action, List<M> result,
      {Duration? timeout, bool mapEquals = false, int interval = 4}) async {
    assert(action.http != null);
    final before = store.getPStateModelFromAction(action);
    final expectedResult = <M>[];
    final statesListener = (PStateModel state) {
      final map = state.toMap();
      expectedResult.add(map[action.name] as M);
    };
    store.dispatch(action.copyWith(afterComplete: statesListener));
    await waitForAction(action, timeout: timeout, interval: interval);
    final after = store.getPStateModelFromAction(action);
    expect(identical(before, after), false);

    if (mapEquals) {
      final resultMap = result.map((e) => (e as ToMap).toMap()).toList();
      final expectedMap =
          expectedResult.map((e) => (e as ToMap).toMap()).toList();
      final dynamic iData = resultMap.last["data"];
      final dynamic eData = expectedMap.last["data"];
      expect(resultMap, expectedMap);
    } else {
      expect(result, expectedResult);
    }
    final afterMap = after.toMap();
    final beforeMap = before.toMap();
    beforeMap.remove(action.name);
    expect(beforeMap.identicalMembers(afterMap), true);
  }

  Future<void> testWebSocketAction<M>(Action<M> action, List<M> result,
      {Duration? timeout, bool mapEquals = false, int interval = 4}) async {
    assert(action.ws != null);
    final before = store.getPStateModelFromAction(action);
    final expectedResult = <M>[];
    final statesListener = (PStateModel state) {
      final map = state.toMap();
      expectedResult.add(map[action.name] as M);
    };
    store.dispatch(action.copyWith(afterComplete: statesListener));
    await waitForAction(action, timeout: timeout, interval: interval);
    final after = store.getPStateModelFromAction(action);
    expect(identical(before, after), false);

    if (mapEquals) {
      final resultMap = result.map((e) => (e as ToMap).toMap()).toList();
      final expectedMap =
          expectedResult.map((e) => (e as ToMap).toMap()).toList();
      expect(resultMap, expectedMap);
    } else {
      expect(result, expectedResult);
    }
    final afterMap = after.toMap();
    final beforeMap = before.toMap();
    beforeMap.remove(action.name);
    expect(beforeMap.identicalMembers(afterMap), true);
  }

  Future<void> testStreamAction<M extends Iterable<dynamic>>(
      Action<M> action, M result) async {
    assert(action.stream != null);
    final before = store.getPStateModelFromAction(action);
    final resultA = await _waitForStreamAction(action);
    print("resultA $resultA");
    expect(resultA, result);
    final after = store.getPStateModelFromAction(action);
    expect(identical(before, after), false);
    final afterMap = after.toMap();
    final beforeMap = before.toMap();
    beforeMap.remove(action.name);
    if (action.isAsync) {
      beforeMap.remove(action.name);
    }
    expect(beforeMap.identicalMembers(afterMap), true);
  }

  Future<void> waitForAction(Action<dynamic> action,
      {Duration? timeout, int interval = 4}) {
    return _createWaitFuture(action, interval, timeout: timeout);
  }

  Future<void> _createWaitFuture(
    Action<dynamic> action,
    int interval, {
    Duration? timeout,
  }) async {
    final c = Completer<void>();

    var done = false;
    Timer? timeoutTimer;

    final periodicTimer =
        Timer.periodic(Duration(milliseconds: interval), (timer) {
      final dynamic field = store.getFieldFromAction(action);
      if (field is AsyncActionField) {
        // print("its async");
        done = field.completed;
      }
      if (field is HttpField) {
        done = field.completed;
      }

      if (field is WebSocketField) {
        done = field.completed;
      }
      // print("checking for done : $done");
      if (done) {
        print("adync done");
        timer.cancel();
        timeoutTimer?.cancel();
        c.complete(null);
      }
    });
    if (timeout != null) {
      timeoutTimer = Timer(timeout, () {
        periodicTimer.cancel();
        c.completeError(
            TimeoutException("$action exceed specified timeout $timeout"));
      });
    }
    return c.future;
  }

  Future<List<dynamic>> _waitForStreamAction(
    Action action, {
    int interval = 4,
    Duration? timeout,
  }) {
    final c = Completer<List<dynamic>>();
    final items = <dynamic>[];
    final wrapper = _StreamWrapper(action.stream!.stream);
    store.dispatch(action.copyWith(
        stream: StreamPayload<dynamic>(stream: wrapper.stream)));

    Timer? timeoutTimer;
    wrapper.sendNext();
    dynamic prevData;
    final periodicTimer =
        Timer.periodic(Duration(milliseconds: interval), (timer) {
      final field = store.getFieldFromAction(action) as StreamField;
      final dynamic data = field.data;
      if (data != null && !identical(prevData, data)) {
        prevData = data;
        items.add(data);
        wrapper.sendNext();
      }
      if (wrapper.done) {
        print("adync done");
        timer.cancel();
        timeoutTimer?.cancel();
        c.complete(items);
      }
    });
    if (timeout != null) {
      timeoutTimer = Timer(timeout, () {
        periodicTimer.cancel();
        c.completeError(
            TimeoutException("$action exceed specified timeout $timeout"));
      });
    }
    return c.future;
  }
}

class _StreamWrapper {
  final StreamQueue<dynamic> sourceStream;
  final _controller = StreamController<dynamic>();
  var _done = false;
  _StreamWrapper(Stream<dynamic> sourceStream)
      : sourceStream = StreamQueue<dynamic>(sourceStream);

  Stream<dynamic> get stream => _controller.stream;
  bool get done => _done;
  void sendNext() async {
    final hasNext = await sourceStream.hasNext;
    if (hasNext) {
      final dynamic next = await sourceStream.next;
      _controller.sink.add(next);
    } else {
      _done = true;
    }
  }
}

class DeepEqualsMatcher extends Matcher {
  final dynamic input;

  DeepEqualsMatcher(this.input);
  @override
  Description describe(Description description) {
    return StringDescription();
  }

  @override
  bool matches(dynamic item, Map matchState) {
    return DeepCollectionEquality.unordered().equals(input, item);
  }
}

extension WidgetTesterExt on WidgetTester {
  Future<void> tapText(String text) => this.tap(find.text(text));
}

void expectOneTextWidget(String text) =>
    expect(find.text(text), findsOneWidget);
