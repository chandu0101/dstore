import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:dstore_test_suite/src/store/app_state.dart';
import 'package:dstore_test_suite/src/store/pstates/simple_form_ps.dart';
import 'package:dstore_test_suite/src/store/selectors/app_selectors.dart';
import 'package:flutter/material.dart';

class SimpleFormWidget extends StatelessWidget {
  static final nameKey = ValueKey("simpleform_name");
  static final radio1Key = ValueKey("simpleform_radio1");
  static final radio2Key = ValueKey("simpleform_radio2");
  static final check1Key = ValueKey("simpleform_check1");
  static final slider1Key = ValueKey("simpleform_slider1");
  static final rangeSlider1Key = ValueKey("simpleform_range_slider");
  static final date1Key = ValueKey("simpleform_date1");
  const SimpleFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectorBuilder<AppState, SimpleFormPS>(
      selector: AppSelectors.simpleForm,
      builder: (context, state) {
        return DForm(
            ff: state.simpleForm,
            child: Builder(
              builder: (context) {
                return ListView(
                  children: [
                    DTextField(key: nameKey, name: SimpleFormKey.name),
                    DRadioField(
                      key: radio1Key,
                      name: SimpleFormKey.radio1,
                      value: SimpleFormRadioGroup1.radio1,
                    ),
                    DRadioField(
                      key: radio2Key,
                      name: SimpleFormKey.radio1,
                      value: SimpleFormRadioGroup1.radio2,
                    ),
                    DCheckbox(key: check1Key, name: SimpleFormKey.check1),
                    DSlider(
                        key: SimpleFormWidget.slider1Key,
                        name: SimpleFormKey.slider1),
                    DRangeSlider(
                        key: rangeSlider1Key, name: SimpleFormKey.rangeSlider1),
                    DDatePicker(
                        key: date1Key,
                        name: SimpleFormKey.date1,
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2021))
                  ],
                );
              },
            ));
      },
    );
  }
}
