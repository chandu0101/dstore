import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/src/widgets/navigator.dart';
part 'nav.ps.dstore.dart';

@PState(nav: true)
class $_NavState extends NavStateI<dynamic> {
  String id = "";
  @override
  List<Page> buildPages() {
    return [];
  }

  @Url("/")
  void home() {
    this.id = "1";
  }

  @override
  Action fallBackNestedStackNonInitializationAction(NavStateI navState) {
    // TODO: implement fallBackNestedStackNonInitializationAction
    throw UnimplementedError();
  }

  @override
  Action notFoundAction(Uri uri) {
    // TODO: implement notFoundAction
    throw UnimplementedError();
  }
}
