import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/option_form.dart';

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
          FormBuilderField(
            name: 'question1',
            validator: FormBuilderValidators.required(),
            builder: (field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Apa bentuk wajahmu?',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                  border: InputBorder.none,
                  errorText: field.errorText,
                ),
                child: OptionForm(
                  options: ['Oval', 'Bulat', 'Persegi', 'Adudu'],
                  fieldState: field,
                ),
              );
            },
          ),
          FormBuilderField(
            name: 'question2',
            validator: FormBuilderValidators.required(),
            builder: (field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Bagaimana tekstur rambutmu?',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                  border: InputBorder.none,
                  errorText: field.errorText,
                ),
                child: OptionForm(
                  options: ['Lurus', 'Bergelombang', 'Keriting', 'Ikal'],
                  fieldState: field,
                ),
              );
            },
          ),
          FormBuilderField(
            name: 'question3',
            validator: FormBuilderValidators.required(),
            builder: (field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Seberapa tebal rambutmu rambutmu ?',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                  border: InputBorder.none,
                  errorText: field.errorText,
                ),
                child: OptionForm(
                  options: ['Tipis', 'Sedang', 'Tebal'],
                  fieldState: field,
                ),
              );
            },
          ),
          FormBuilderField(
            name: 'question4',
            validator: FormBuilderValidators.required(),
            builder: (field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Bagaimana postur tubuhmu ?',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                  border: InputBorder.none,
                  errorText: field.errorText,
                ),
                child: OptionForm(
                  options: ['Tinggi', 'Sedang', 'Pendek'],
                  fieldState: field,
                ),
              );
            },
          ),
          FormBuilderField(
            name: 'question5',
            validator: FormBuilderValidators.required(),
            builder: (field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Bagaimana kamu mendeskripsikan dirimu ?',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                  border: InputBorder.none,
                  errorText: field.errorText,
                ),
                child: OptionForm(
                  options: ['Santai', 'Berani', 'Profesional', 'Kreatif'],
                  fieldState: field,
                ),
              );
            },
          ),
          FormBuilderField(
            name: 'question6',
            validator: FormBuilderValidators.required(),
            builder: (field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Berapa usia Anda saat ini (dalam tahun)?',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                  border: InputBorder.none,
                  errorText: field.errorText,
                ),
                child: OptionForm(
                  options: ['< 18', '18 - 24', '25 - 34', '35 - 44', '> 45'],
                  fieldState: field,
                ),
              );
            },
          ),
          FormBuilderField(
            name: 'question7',
            validator: FormBuilderValidators.required(),
            builder: (field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText:
                      'Berapa banyak gaya rambut yang ingin kamu lihat ?',
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter'),
                  border: InputBorder.none,
                  errorText: field.errorText,
                ),
                child: OptionForm(
                  options: ['1', '2', '3', 'Sebanyak mungkin'],
                  fieldState: field,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
