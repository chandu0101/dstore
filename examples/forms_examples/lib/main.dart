import 'package:dstore/dstore.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/material.dart' hide FormState, FormField;
import 'package:forms_examples/store/app_state.dart';
import 'package:forms_examples/store/pstates/form_state.dart';
import 'package:forms_examples/store/selectors/app_selectors.dart';

void main() {
  runApp(FormsExample());
}

class FormsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forms Example"),
        ),
        body: SelectorBuilder<AppState, FormState>(
          selector: AppSelectors.foromState,
          builder: (context, state) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text("Simple Form"),
                SimpleDForm(ff: state.simpleForm)
              ],
            ),
          ),
        ));
  }
}

class SimpleDForm extends StatelessWidget {
  final FormField<SimpleForm> ff;

  const SimpleDForm({Key? key, required this.ff}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DForm(ff: ff, child: FormWidget());
  }
}

class FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DTextField(name: SimpleFormKey.name),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DRadioField(name: SimpleFormKey.r, value: REnum.one),
              DRadioField(name: SimpleFormKey.r, value: REnum.two),
              DRadioField(name: SimpleFormKey.r, value: REnum.three)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: DCheckbox(
            name: SimpleFormKey.c1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: DDatePicker(
            name: SimpleFormKey.date,
            firstDate: DateTime(2021),
            lastDate: DateTime(2022),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: DSlider(
            name: SimpleFormKey.rating,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: DRangeSlider(
            name: SimpleFormKey.rangeRating,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  print("Resetting Form");
                  context.dform.resetForm();
                },
                child: Text("Reset Form")),
            SizedBox(
              width: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  // print("Form Value ${ff.value}");
                },
                child: Text("Submit Form"))
          ],
        )
      ],
    );
  }
}
