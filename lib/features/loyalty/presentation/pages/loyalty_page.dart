import 'package:flutter/material.dart';
import 'package:tlb_app/constants/navigations/navigation_index.dart';
import 'package:tlb_app/my_app.dart';
import 'package:tlb_app/global_widget.dart';

class LoyaltyPage extends StatelessWidget {
  const LoyaltyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loyalty Page"),
      ),
      bottomNavigationBar: NavBar(currentIndex: loyaltyPageIndex),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Main Content"),
          ],
        ),
      ),
    );
  }
}
