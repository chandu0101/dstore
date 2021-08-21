import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/nav.dart';
import 'package:dstore_test_suite/src/store/pstates/nav/tabs_nav.dart';
import "package:dstore_flutter/dstore_flutter.dart";
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tab1"),
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tab2"),
      ),
    );
  }
}

class Tab2StackHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab2 Stack Home"),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              context.dispatch(
                  TabsNestedStack_NestedActions.tabItemDetails(id: "t1"));
            },
            title: Text("TabItem1"),
          )
        ],
      ),
    );
  }
}

class Tab2StackItemDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectorBuilder<AppState, TabsNestedStack_Nested>(
        selector: AppSelectors.tabsNested_nested,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Selected Item ${state.tItem}"),
            ),
            body: Center(
              child: Text("TabNested Stack Selected tab item ${state.tItem} "),
            ),
          );
        });
  }
}

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Tab3"),
      ),
    );
  }
}

class TabShell extends StatelessWidget {
  final Widget child;

  const TabShell({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("Building tab shell");
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 64),
          child: SafeArea(
            child: UrlBuilder(builder: (uri) {
              final tab = getSelectedTab(uri);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        print("tab1 click");
                        context.dispatch(SimpleNavPSActions.tabs());
                      },
                      child: Text(
                        "Tab1",
                        style:
                            TextStyle(color: tab == "tab1" ? Colors.red : null),
                      )),
                  TextButton(
                      onPressed: () {
                        print("tab2 click");
                        context.dispatch(TabsNestedStackActions.tab2());
                      },
                      child: Text("Tab2",
                          style: TextStyle(
                              color: tab == "tab2" ? Colors.red : null))),
                  TextButton(
                      onPressed: () {
                        print("tab3 click");
                        context.dispatch(TabsNestedStackActions.tab3());
                      },
                      child: Text("Tab3",
                          style: TextStyle(
                              color: tab == "tab3" ? Colors.red : null))),
                ],
              );
            }),
          )),
      body: child,
    );
  }

  String getSelectedTab(Uri uri) {
    print("get tting tab uri $uri");
    final path = uri.path;
    if (path.startsWith("/tab1")) {
      return "tab1";
    } else if (path.startsWith("/tab2")) {
      return "tab2";
    } else if (path.startsWith("/tab3")) {
      return "tab3";
    }
    return "tab1";
  }
}
