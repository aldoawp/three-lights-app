import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/option_form.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/style/catalogue_text_style.dart';
import 'package:tlb_app/my_app.dart';

class AskAiForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;
  const AskAiForm({super.key, required this.onSubmit});

  @override
  State<AskAiForm> createState() => _AskAiFormState();
}

class _AskAiFormState extends State<AskAiForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _validateAndSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      widget.onSubmit(_formKey.currentState!.value);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mohon lengkapi semua jawaban.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderField(
                name: 'question1',
                validator: FormBuilderValidators.required(),
                builder: (field) => InputDecorator(
                  decoration: InputDecoration(
                    label: Text(
                      '1. Apa bentuk wajahmu?',
                      style: CatalogueTextStyle.questionAi,
                    ),
                    border: InputBorder.none,
                    errorText: field.errorText,
                  ),
                  child: OptionForm(
                    options: ['Oval', 'Bulat', 'Persegi', 'Adudu'],
                    fieldState: field,
                  ),
                ),
              ),
              FormBuilderField(
                name: 'question2',
                validator: FormBuilderValidators.required(),
                builder: (field) => InputDecorator(
                  decoration: InputDecoration(
                    label: Text(
                      '2. Bagaimana tekstur rambutmu?',
                      style: CatalogueTextStyle.questionAi,
                    ),
                    border: InputBorder.none,
                    errorText: field.errorText,
                  ),
                  child: OptionForm(
                    options: ['Lurus', 'Bergelombang', 'Keriting', 'Ikal'],
                    fieldState: field,
                  ),
                ),
              ),
              FormBuilderField(
                name: 'question3',
                validator: FormBuilderValidators.required(),
                builder: (field) => InputDecorator(
                  decoration: InputDecoration(
                    label: Text(
                      '3. Seberapa tebal rambutmu rambutmu ?',
                      style: CatalogueTextStyle.questionAi,
                    ),
                    border: InputBorder.none,
                    errorText: field.errorText,
                  ),
                  child: OptionForm(
                    options: ['Tipis', 'Sedang', 'Tebal'],
                    fieldState: field,
                  ),
                ),
              ),
              FormBuilderField(
                name: 'question4',
                validator: FormBuilderValidators.required(),
                builder: (field) => InputDecorator(
                  decoration: InputDecoration(
                    label: Text(
                      '4. Bagaimana postur tubuhmu ?',
                      style: CatalogueTextStyle.questionAi,
                    ),
                    border: InputBorder.none,
                    errorText: field.errorText,
                  ),
                  child: OptionForm(
                    options: ['Tinggi', 'Sedang', 'Pendek'],
                    fieldState: field,
                  ),
                ),
              ),
              FormBuilderField(
                name: 'question5',
                validator: FormBuilderValidators.required(),
                builder: (field) => InputDecorator(
                  decoration: InputDecoration(
                    label: Text(
                      '5. Bagaimana kamu mendeskripsikan dirimu ?',
                      style: CatalogueTextStyle.questionAi,
                    ),
                    border: InputBorder.none,
                    errorText: field.errorText,
                  ),
                  child: OptionForm(
                    options: ['Santai', 'Berani', 'Profesional', 'Kreatif'],
                    fieldState: field,
                  ),
                ),
              ),
              FormBuilderField(
                name: 'question6',
                validator: FormBuilderValidators.required(),
                builder: (field) => InputDecorator(
                  decoration: InputDecoration(
                    label: Text(
                      '6. Berapa usia Anda saat ini (dalam tahun)?',
                      style: CatalogueTextStyle.questionAi,
                    ),
                    border: InputBorder.none,
                    errorText: field.errorText,
                  ),
                  child: OptionForm(
                    options: ['< 18', '18 - 24', '25 - 34', '35 - 44', '> 45'],
                    fieldState: field,
                  ),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: _validateAndSubmit,
          child: Text('Simpan Jawaban',
              style: TextStyle(color: ColorResource.primary)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(color: ColorResource.primary, width: 2),
          ),
        ),
      ],
    );
  }
}
