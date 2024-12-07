import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Border? border;
  final Color? color;
  const CustomCardWidget(
      {super.key, required this.child, this.padding, this.border, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border ?? Border.all(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        color: color ?? Colors.white,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(12),
        child: child,
      ),
    );
  }
}
