import 'package:dstore/dstore.dart';
import 'package:forms_examples/store/app_state.dart';
import 'package:forms_examples/store/pstates/form_state.dart';

part "app_selectors.dstore.dart";

@Selectors()
class $_AppSelectors {
  static FormState foromState(AppState appState) => appState.formState;
}
