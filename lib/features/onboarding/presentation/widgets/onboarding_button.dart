import 'package:flutter/material.dart';
import 'package:tlb_app/constants/enum.dart';
import 'package:tlb_app/main.dart';

class OnboardingButton extends StatelessWidget {
  final String label;
  final ButtonType type;
  final IconData icon;

  const OnboardingButton({
    super.key,
    required this.label,
    required this.type,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.filled) {
      return FilledButton(
        onPressed: () {},
        style: ButtonStyleResource.primaryButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: TextStyleResource.buttonLabel),
            const SizedBox(
              width: 12,
            ),
            Icon(icon),
          ],
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: () {},
        style: ButtonStyleResource.secondaryButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 12,
            ),
            Text(
              label,
            ),
          ],
        ),
      );
    }
  }
}
