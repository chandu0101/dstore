import 'package:dstore/dstore.dart';
part "unions.dstore.dart";

@DUnion()
void $_MyUnion(String s, void Function(String code, String? boo) codeent) {}
