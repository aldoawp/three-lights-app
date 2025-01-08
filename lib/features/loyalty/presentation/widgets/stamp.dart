import 'package:flutter/material.dart';

class Stamp extends StatelessWidget {
  final bool filled;

  const Stamp({super.key, this.filled = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
        color: filled ? const Color(0xFF4CAF50) : Colors.transparent,
      ),
      child: filled
          ? const Icon(Icons.person, color: Colors.white)
          : null,
    );
  }
}