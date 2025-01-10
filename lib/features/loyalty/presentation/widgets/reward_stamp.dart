import 'package:flutter/material.dart';

class RewardStamp extends StatelessWidget {
  const RewardStamp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
      child: const Center(
        child: Text(
          '50%',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}