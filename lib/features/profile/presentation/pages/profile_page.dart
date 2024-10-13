import 'package:flutter/material.dart';
import 'package:tlb_app/constants/navigations/navigation_index.dart';
import 'package:tlb_app/my_app.dart';
import 'package:tlb_app/global_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: profilePageIndex,
      ),
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
