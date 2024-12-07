import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AskAiForm extends StatefulWidget {
  const AskAiForm({super.key});

  @override
  State<AskAiForm> createState() => _AskAiFormState();
}

class _AskAiFormState extends State<AskAiForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderChoiceChip (
              name: 'q1',
              decoration: InputDecoration(
                labelText: '??',
              ),
              spacing: 5,
              options: ['kontol', 'memek']
                  .map(
                    (lang) => FormBuilderChipOption(
                      value: lang,
                      child: Text(lang),
                    ),
                  )
                  .toList()),
        ],
      ),
    );
  }
}
