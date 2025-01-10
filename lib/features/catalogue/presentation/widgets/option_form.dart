import 'package:flutter/material.dart';
import 'package:tlb_app/features/catalogue/presentation/widgets/custom_card_widget.dart';
import 'package:tlb_app/my_app.dart';

class OptionForm extends StatelessWidget {
  const OptionForm({
    super.key,
    required this.options,
    required this.fieldState,
  });

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
      physics: const NeverScrollableScrollPhysics(),
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
                  ? Border.all(color: ColorResource.primary, width: 2)
                  : Border.all(color: Colors.grey.shade300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isOptionSelected)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                      child: Icon(
                        Icons.check_circle,
                        color: ColorResource.primary,
                        size: 20,
                      ),
                    ),
                  Text(
                    option,
                    style: TextStyle(
                      color: isOptionSelected
                          ? ColorResource.primary
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
