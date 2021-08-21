import 'package:dstore/dstore.dart';
import 'package:flutter/material.dart' hide FormField, Action;
part 'simple_form_ps.ps.dstore.dart';
part "simple_form_ps.dstore.dart";

@PState()
class $_SimpleFormPS {
  FormField<SimpleForm> simpleForm =
      FormField<SimpleForm>(value: SimpleForm(), validators: {});
}

@FormModel()
class $_SimpleForm {
  String name = "name";
  SimpleFormRadioGroup1 radio1 = SimpleFormRadioGroup1.radio1;
  bool check1 = false;
  double slider1 = 0.5;
  RangeValues rangeSlider1 = RangeValues(0.2, 0.5);
  DateTime date1 = DateTime.now();
}

enum SimpleFormRadioGroup1 { radio1, radio2 }
