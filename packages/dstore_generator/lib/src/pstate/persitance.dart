import 'package:analyzer/dart/element/element.dart';
import 'package:dstore_annotation/dstore_annotation.dart';
import 'package:dstore_generator/src/utils/utils.dart';

bool isPersitable(PState pstate) {
  final persistMode = DBuilderOptions.psBuilderOptions.persistMode;
  print("persistMode $persistMode pstate ${pstate.persist}");
  if (persistMode == null && pstate.persist != null) {
    throw ArgumentError.value(
        "You should provide pesistMode option in build.yaml for dstore|ps builder");
  } else if (persistMode == null) {
    return false;
  }
  var persist = false;
  switch (persistMode) {
    case PersistMode.ExplicitPersist:
      persist = pstate.persist == true;
      break;
    case PersistMode.ExplicitDontPersist:
      if (pstate.persist == false) {
        persist = false;
      } else {
        persist = true;
      }
      break;
  }
  return persist;
}
