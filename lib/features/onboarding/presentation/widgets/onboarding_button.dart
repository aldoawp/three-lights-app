import 'package:flutter/material.dart';
import 'package:tlb_app/main.dart';

class OnboardingButton extends StatelessWidget {
  final String label;
  final ButtonType type;
  final IconData icon;
  final VoidCallback onPressedAction;

  const OnboardingButton({
    super.key,
    required this.label,
    required this.type,
    required this.icon,
    required this.onPressedAction,
  });

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.filled) {
      return Expanded(
        child: FilledButton(
          onPressed: onPressedAction,
          style: ButtonStyleResource.primaryButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, style: TextStyleResource.buttonFilledLabel),
              const SizedBox(
                width: 12,
              ),
              Icon(icon),
            ],
          ),
        ),
      );
    } else {
      return Expanded(
        child: OutlinedButton(
          onPressed: onPressedAction,
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
                style: TextStyleResource.buttonOutlinedLabel,
              ),
            ],
          ),
        ),
      );
    }
  }
}
