import 'package:flutter/material.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/custom_card_widget.dart';

class OptionForm extends StatelessWidget {
  const OptionForm(
      {super.key, required this.options, required this.fieldState});

  final FormFieldState<dynamic> fieldState;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 4,
      crossAxisSpacing: 15,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: options.map(
        (option) {
          bool isOptionSelected = fieldState.value == option;
          return GestureDetector(
              onTap: () {
                fieldState.didChange(option);
              },
              child: CustomCardWidget(
                  height: 40,
                  border: isOptionSelected
                      ? Border.all(color: Colors.blue)
                      : Border(),
                  child: Text(option)));
        },
      ).toList(),
    );
  }
}
