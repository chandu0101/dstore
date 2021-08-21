import 'package:dstore/dstore.dart';
import 'package:flutter/material.dart' hide FormField, Action;
import 'package:meta/meta.dart';
part 'form_state.ps.dstore.dart';
part "form_state.dstore.dart";

@PState()
class $_FormState {
  FormField<SimpleForm> simpleForm =
      FormField(value: SimpleForm(), validators: {});
}

enum REnum { one, two, three }

@FormModel()
class $_SimpleForm {
  String name = "initialName";
  REnum? r;
  bool? c1 = false;
  double rating = 0.3;
  RangeValues rangeRating = RangeValues(0.2, 0.5);
  DateTime date = DateTime.now();
}
