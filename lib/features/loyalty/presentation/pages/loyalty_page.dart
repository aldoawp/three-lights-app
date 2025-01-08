import 'package:flutter/material.dart';
import 'package:tlb_app/constants/navigations/navigation_index.dart';
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
      bottomNavigationBar: NavBar(currentIndex: loyaltyPageIndex),
      body: Center(
        child: SingleChildScrollView(
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
              const HistoryList(), // History List added here
            ],
          ),
        ),
      ),
    );
  }
}
