// Developer Card Widget
import 'package:flutter/material.dart';

class DeveloperCard extends StatelessWidget {
  final String name;
  final String studentId;
  final String imagePath;

  const DeveloperCard({
    super.key,
    required this.name,
    required this.studentId,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Developer Picture
        ClipRRect(
          borderRadius: BorderRadius.circular(50), // Circular image
          child: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        // Developer Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                studentId,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
