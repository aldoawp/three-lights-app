import 'package:flutter/material.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/history_item_data.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HistoryItemData> historyItems = [
      HistoryItemData(
          date: DateTime(2024, 12, 9),
          status: "CHECK-IN",
          stamp: "Stamp ke - 1"),
      HistoryItemData(
          date: DateTime(2024, 12, 9),
          status: "CHECK-IN",
          stamp: "Stamp ke - 2"),
      HistoryItemData(
          date: DateTime(2024, 12, 9),
          status: "CHECK-IN",
          stamp: "Stamp ke - 3"),
      // Add more history items here
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.list),
            SizedBox(width: 8),
            Text(
              'Riwayat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true, // Important for ListView inside Column
          physics:
              const NeverScrollableScrollPhysics(), // Disable scrolling of ListView
          itemCount: historyItems.length,
          itemBuilder: (context, index) {
            return HistoryItem(data: historyItems[index]);
          },
        ),
      ],
    );
  }
}
