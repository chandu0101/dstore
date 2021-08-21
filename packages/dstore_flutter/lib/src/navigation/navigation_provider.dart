import 'package:dstore_flutter/src/navigation/history/history.dart';
import 'package:flutter/material.dart';

class NavigationProvider extends InheritedWidget {
  final History dotTouchmeHistory;

  NavigationProvider(
      {required this.dotTouchmeHistory, Key? key, required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(NavigationProvider oldWidget) {
    return oldWidget.dotTouchmeHistory != dotTouchmeHistory;
  }

  String get url => dotTouchmeHistory.url;

  static NavigationProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NavigationProvider>()!;
  }
}

extension BuildContextNavigationProviderExt on BuildContext {
  NavigationProvider get dnavigation => NavigationProvider.of(this);
}
