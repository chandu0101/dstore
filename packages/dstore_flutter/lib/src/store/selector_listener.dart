import 'package:dstore/dstore.dart';
import 'package:flutter/material.dart';
import 'package:dstore_flutter/src/store/store_provider.dart';

class SelectorListener<S extends AppStateI<S>, I> extends StatefulWidget {
  final Selector<S, I> selector;
  final UnSubscribeOptions? options;
  final void Function(BuildContext, I) listener;
  final Widget? child;
  final void Function(BuildContext context, I state)? onInitState;
  final void Function(BuildContext context, I state)? onInitialBuild;
  final void Function(BuildContext context, I state)? onDispose;

  const SelectorListener(
      {Key? key,
      required this.selector,
      required this.listener,
      this.child,
      this.onInitState,
      this.onDispose,
      this.onInitialBuild,
      this.options})
      : super(key: key);

  @override
  _SelectorListenerState<S, I> createState() => _SelectorListenerState<S, I>();
}

class _SelectorListenerState<S extends AppStateI<S>, I>
    extends State<SelectorListener<S, I>> {
  late SelectorUnSubscribeFn _unsubFn;
  late I _state;
  void Function()? _lsitener;
  Store<S>? storeRef;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final store = context.storeTyped<S>();
    if (storeRef != store) {
      if (storeRef != null) {
        _unSubscribe(widget.options);
      }
      _lsitener = () {
        _state = widget.selector.fn(store.state);
        widget.listener(context, _state);
      };
      _state = widget.selector.fn(store.state);
      _unsubFn = store.subscribeSelector(widget.selector, _lsitener!);
      if (storeRef == null) {
        storeRef = store;
        widget.onInitState?.call(context, _state);
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          widget.onInitialBuild?.call(context, _state);
        });
      } else {
        storeRef = store;
      }
    }
  }

  @override
  void didUpdateWidget(covariant SelectorListener<S, I> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selector != widget.selector) {
      _unSubscribe(oldWidget.options);
      final store = context.storeTyped<S>();
      _unsubFn = store.subscribeSelector(widget.selector, _lsitener!);
      _state = widget.selector.fn(store.state);
      widget.listener(context, _state);
    }
  }

  void _unSubscribe(UnSubscribeOptions? options) {
    _unsubFn(options);
  }

  @override
  void dispose() async {
    print("Calling dispose");
    widget.onDispose?.call(context, _state);
    _unSubscribe(widget.options);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Selector Listener build ${widget.child?.runtimeType}");
    return widget.child == null ? SizedBox.shrink() : widget.child!;
  }
}
