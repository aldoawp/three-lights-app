import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryItemData {
  final DateTime date;
  final String status;
  final String stamp;

  HistoryItemData(
      {required this.date, required this.status, required this.stamp});
}

class HistoryItem extends StatelessWidget {
  final HistoryItemData data;
  const HistoryItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.check, color: Colors.green),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.status),
                  Text(data.stamp),
                ],
              ),
            ),
            Text(DateFormat('dd-MM-yyyy').format(data.date)),
          ],
        ),
      ),
    );
  }
}
