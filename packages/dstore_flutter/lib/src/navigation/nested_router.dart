import 'dart:async';

import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_flutter/src/navigation/history/history.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Action;
import "./navigation_provider.dart";

class NestedRouter<AS extends AppStateI<AS>, S extends NestedNavStateI<dynamic>>
    extends StatefulWidget {
  final Selector<AS, S> selector;
  final UnSubscribeOptions? options;

  const NestedRouter({
    Key? key,
    required this.selector,
    this.options,
  }) : super(key: key);
  @override
  _NestedRouterState<AS, S> createState() => _NestedRouterState();
}

class _NestedRouterState<AS extends AppStateI<AS>,
    S extends NestedNavStateI<dynamic>> extends State<NestedRouter<AS, S>> {
  late History history;
  late NestedNavHistory nestedHistory;
  late NestedNavStateI navState;
  late Dispatch _dispatch;
  late final GlobalKey<NavigatorState> navigatorKey;
  late Action initStateAction;
  bool setStateOnupdate = false;
  bool prepared = false;
  @override
  void initState() {
    super.initState();
    print("On init NestedRouter");
    navigatorKey = GlobalKey();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    history = context.dnavigation.dotTouchmeHistory;
  }

  @override
  void didUpdateWidget(covariant NestedRouter<AS, S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Updating nested router widget");
    context.dispatch(initStateAction);
    setStateOnupdate = true;
  }

  @override
  Widget build(BuildContext context) {
    _dispatch = context.dispatch;
    var ssonup = false;
    if (setStateOnupdate) {
      ssonup = true;
      setStateOnupdate = false;
    }
    return SelectorBuilder<AS, S>(
      selector: widget.selector,
      options: widget.options,
      setStateOnUpdate: ssonup,
      onInitState: (context, state) {
        state.mounted = true;
        print("on Init State");
        final a = state.dontTouchMe.initialSetup!;
        initStateAction = a;
        if (!state.dontTouchMe.isDirty) {
          state.dontTouchMe.isDirty = true;
          context.dispatch(a);
        }
        final typeName = state.dontTouchMe.typeName;
        state.dontTouchMe.hisotry = history;
        history.nestedNavsHistory[typeName] = createNestedNavHistory(history);
        nestedHistory = history.nestedNavsHistory[typeName]!;
        final nestedOrigin = history.nestedNavOrigins[typeName];
        nestedHistory.originAction = nestedOrigin;
        nestedHistory.rootUrl = history.url;
        nestedHistory.historyMode = state.dontTouchMe.historyMode;
        nestedHistory.parentStackTypeName = history.currentActiveNestedNav;
        nestedHistory.parentNavKey = history.currentNavKey;
        history.nestedNavOrigins.remove(typeName);
        history.currentActiveNestedNav = typeName;
        navState = state;
        history.currentNavKey = navigatorKey;
        print("hitory currentNavKey ${history.currentNavKey}");
        print("nestedOrigin  ${nestedHistory.originAction}");
      },
      onInitialBuild: (context, state) {
        prepared = true;
        setStateOnupdate = true;
        setBeforeLeave(history, state);
        setState(() {});
        print("nested router in  initialbuild ${nestedHistory.originAction}");
        if (nestedHistory.originAction != null) {
          final a = nestedHistory.originAction!;
          nestedHistory.originAction = null;
          scheduleMicrotask(() => _dispatch(a));
        }
        if (state.dontTouchMe.isDirty &&
            state.dontTouchMe.previousStackedUrls.isNotEmpty) {
          state.dontTouchMe.previousStackedUrls.forEach((url) {
            if (url != null) {
              nestedHistory.push(url);
            }
          });
        }
      },
      shouldRebuild: (context, prevState, newState) {
        setBeforeLeave(history, newState);
        newState.dontTouchMe.hisotry = history;
        navState = newState;
        navState.mounted = true;
        print("Newstate of nestedrouter $newState");
        print("hitory currentNavKey ${history.currentNavKey}");
        if (newState.meta.redirectToAction != null) {
          print("Nested Router in redirect");
          final meta = newState.meta;
          final action = meta.redirectToAction!;
          meta.redirectToAction = null;
          history.originAction = meta.originAction;
          meta.originAction = null;
          scheduleMicrotask(() => _dispatch(action));
          return false;
        } else if (history.originAction != null) {
          print("Nested Router origin");
          final a = history.originAction!;
          history.originAction = null;
          scheduleMicrotask(() => _dispatch(a));
          return false;
        } else if (nestedHistory.originAction != null) {
          print("Nested Router in nestedOrigin");
          final a = nestedHistory.originAction!;
          nestedHistory.originAction = null;
          scheduleMicrotask(() => _dispatch(a));
          return false;
        } else {
          history.currentNavKey = navigatorKey;
          print("nestedrouter in update");
          _updateUrl();
          history.currentActiveNestedNav = newState.dontTouchMe.typeName;
          return true;
        }
      },
      onDispose: (context, state) {
        print("Disposing nested nav $state");
        final typeName = state.dontTouchMe.typeName;
        history.nestedNavsHistory.remove(typeName);
        history.currentNavKey = null;
        history.currentActiveNestedNav = null;
        print("setting current nav null");
        state.mounted = false;
      },
      builder: (context, state) {
        if (prepared) {
          print("before build pages");
          print(
            "building nested nav $state  ${state.dontTouchMe}",
          );
          print("after buildapges");
          final pages = state.page != null ? [state.page!] : state.buildPages();
          if (state.dontTouchMe.historyMode == HistoryMode.stack) {
            final sUrls = state.dontTouchMe.previousStackedUrls;
            if (pages.length == 1) {
              sUrls.clear();
            } else if (pages.length <= sUrls.length) {
              sUrls.removeLast();
            } else if (pages.length > sUrls.length) {
              print("dontTouchMe url $state.dontTouchMe.url");
              sUrls.add(state.dontTouchMe.url);
            }
          }
          return Navigator(
            key: navigatorKey,
            pages: pages,
            onPopPage: (route, dynamic result) {
              if (!handleBeforeLeave(history: history, store: context.store)) {
                return false;
              }
              if (route.didPop(result)) {
                print("On Pop nested");
                nestedHistory.goBack();
                return true;
              } else {
                print("Nested pop fail");
                return false;
              }
            },
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  void _updateUrl() {
    print('url chnaged ${history.urlChangedInSystem}');
    if (history.urlChangedInSystem) {
      history.urlChangedInSystem = false;
    } else {
      if (navState.dontTouchMe.url != null) {
        final url = navState.dontTouchMe.url!;
        print("pushing url ${navState.dontTouchMe.url}");
        if (history.urlUpdateMode == HistoryUpdate.replace) {
          nestedHistory.replace(url);
        } else {
          nestedHistory.push(url);
        }
        history.urlUpdateMode = null;
      }
    }
  }
}
