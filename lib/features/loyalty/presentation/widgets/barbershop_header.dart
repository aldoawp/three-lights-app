import 'package:flutter/material.dart';

class BarbershopHeader extends StatelessWidget {
  const BarbershopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent, // Set background to transparent
          ),
          child: Image.asset(
            'lib/assets/images/logo.png',
            height: 50,
            errorBuilder: (context, error, stackTrace) => const Text("Logo"),
          ),
        ),
      ],
    );
  }
}
