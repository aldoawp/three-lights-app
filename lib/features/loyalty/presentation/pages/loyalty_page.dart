import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/constants/navigations/navigation_index.dart';
import 'package:tlb_app/features/loyalty/presentation/bloc/loyalty_bloc.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/history_item_data.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/history_list.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/loyalty_card.dart';
import 'package:tlb_app/my_app.dart';
import 'package:tlb_app/global_widget.dart';

class LoyaltyPage extends StatelessWidget {
  const LoyaltyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Loyalty Page",
          style: TextStyleResource.appBarHeadline,
        ),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary,
        ),
      ),
      // bottomNavigationBar: NavBar(currentIndex: loyaltyPageIndex),
      body: SingleChildScrollView(
        // Added SingleChildScrollView
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(24.0),
                child: LoyaltyCard(),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<LoyaltyBloc, LoyaltyState>(
              // Use BlocBuilder here
              builder: (context, state) {
                List<HistoryItemData> historyItems = [];
                if (state is LoyaltyUpdated) {
                  historyItems = state.history;
                }
                return HistoryList(historyItems: historyItems);
              },
            ),
          ],
        ),
      ),
    );
  }
}
