import 'package:flutter/material.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/reward_stamp.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/stamp.dart';

class StampRow extends StatelessWidget {
  final int stampsCollected;

  const StampRow({super.key, required this.stampsCollected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Selesaikan stamp berikut & dapatkan rewardnya'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            // Generate 5 stamps (4 + reward)
            return Stamp(filled: index < stampsCollected);
          }),
        ),
      ],
    );
  }
}
