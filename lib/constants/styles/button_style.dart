part of '../../my_app.dart';

class ButtonStyleResource {
  static const primaryButton = ButtonStyle(
      iconSize: WidgetStatePropertyAll(24),
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
      minimumSize: WidgetStatePropertyAll(Size(0, 70)),
      backgroundColor: WidgetStatePropertyAll(Color(0xFF588B78)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)))));

  static const secondaryButton = ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(ColorResource.primary),
      iconSize: WidgetStatePropertyAll(24),
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
      minimumSize: WidgetStatePropertyAll(Size(0, 70)),
      overlayColor: WidgetStatePropertyAll(ColorResource.primaryTransparent),
      side: WidgetStatePropertyAll(BorderSide(color: ColorResource.primary)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)))));
}
