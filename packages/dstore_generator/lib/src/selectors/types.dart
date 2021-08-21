import 'package:dstore_generator/src/utils/utils.dart';

class SelectorMeta {
  final Field stateField;
  final String name;
  final String code;

  SelectorMeta(this.stateField, this.name, this.code);
}

class SelectorDeps {
  final Map<String, List<String>> mainDeps;
  final Map<String, List<String>>? wsDeps;
  final Map<String, List<String>>? sfDeps;

  SelectorDeps({required this.mainDeps, this.wsDeps, this.sfDeps});
}
