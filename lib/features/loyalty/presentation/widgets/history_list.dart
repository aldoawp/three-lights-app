import 'package:flutter/material.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/history_item_data.dart';

class HistoryList extends StatelessWidget {
  final List<HistoryItemData> historyItems;
  const HistoryList({super.key, required this.historyItems});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      historyItems.isEmpty
          ? const Center(child: Text("No history yet"))
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                return HistoryItem(data: historyItems[index]);
              },
            ),
    ]);
  }
}
