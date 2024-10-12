import 'package:flutter/material.dart';
import 'package:tlb_app/my_app.dart';

class OnboardingButton extends StatelessWidget {
  final String label;
  final ButtonType type;
  final IconData? icon;
  final IconPosition? iconPosition;
  final VoidCallback onPressedAction;

  const OnboardingButton({
    super.key,
    required this.label,
    required this.type,
    this.icon,
    this.iconPosition,
    required this.onPressedAction,
  });

  @override
  Widget build(BuildContext context) {
    Widget childWidget;
    ButtonStyle buttonStyle;
    TextStyle textStyle;

    if (type == ButtonType.filled) {
      buttonStyle = ButtonStyleResource.primaryButton;
      textStyle = TextStyleResource.buttonFilledLabel;
    } else {
      buttonStyle = ButtonStyleResource.secondaryButton;
      textStyle = TextStyleResource.buttonOutlinedLabel;
    }

    if (iconPosition == IconPosition.leading) {
      childWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          if (icon != null)
            const SizedBox(
              width: 12,
            ),
          Text(label, style: textStyle),
        ],
      );
    } else {
      childWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: textStyle),
          if (icon != null)
            const SizedBox(
              width: 12,
            ),
          Icon(icon),
        ],
      );
    }

    if (type == ButtonType.filled) {
      return Expanded(
        child: FilledButton(
          onPressed: onPressedAction,
          style: buttonStyle,
          child: childWidget,
        ),
      );
    } else {
      return Expanded(
        child: OutlinedButton(
          onPressed: onPressedAction,
          style: buttonStyle,
          child: childWidget,
        ),
      );
    }
  }
}
