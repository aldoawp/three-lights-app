import 'package:flutter/material.dart';

class LoyaltyCardTitle extends StatelessWidget {
  const LoyaltyCardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'LOYALTY CARD',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}