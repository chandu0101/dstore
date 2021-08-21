import 'package:dstore/dstore.dart';
import 'package:flutter/material.dart' hide Action;

class StoreProvider extends StatefulWidget {
  final Store<AppStateI<dynamic>> store;
  final Widget? loadingPlaceHolder;
  final Widget? storageReadErrorPloaceHolder;
  final Widget child;

  const StoreProvider(
      {Key? key,
      required this.store,
      this.loadingPlaceHolder,
      this.storageReadErrorPloaceHolder,
      required this.child})
      : super(key: key);
  @override
  _StoreProviderState createState() => _StoreProviderState();
}

class _StoreProviderState extends State<StoreProvider> {
  dynamic error;
  @override
  void initState() {
    super.initState();
    if (!widget.store.isReady) {
      widget.store.listenForReadyState((e, st) {
        print("store preapred from storage $e ");
        print(st);
        setState(() {
          error = e;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.store.isReady
        ? _StoreProviderInherited(
            store: widget.store,
            child: widget.child,
          )
        : error != null
            ? widget.storageReadErrorPloaceHolder ??
                StoreTempShell(message: "Failing while creting store $error")
            : widget.loadingPlaceHolder ??
                StoreTempShell(
                  message: "Preapring store..",
                );
  }

  @override
  void dispose() {
    widget.store.cleanup();
    super.dispose();
  }
}

class _StoreProviderInherited extends InheritedWidget {
  final Store<AppStateI<dynamic>> _store;

  const _StoreProviderInherited({
    Key? key,
    required Store<AppStateI<dynamic>> store,
    required Widget child,
  })  : _store = store,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_StoreProviderInherited oldWidget) {
    return oldWidget._store != this._store;
  }

  static Store<AppStateI<dynamic>> of(BuildContext context) {
    final cValue =
        context.dependOnInheritedWidgetOfExactType<_StoreProviderInherited>();
    if (cValue == null) {
      throw Exception(
          "You should wrap your app root with StoreProvider from dstore");
    }
    return cValue._store;
  }
}

extension DStoreContextExtensionMethods on BuildContext {
  Store<AppStateI<dynamic>> get store => _StoreProviderInherited.of(this);
  dynamic dispatch(Action<dynamic> action) => store.dispatch(action);
  Store<S> storeTyped<S extends AppStateI<S>>() => store as Store<S>;
}

class StoreTempShell extends StatelessWidget {
  final String message;
  const StoreTempShell({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
