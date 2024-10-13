import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tlb_app/constants/navigations/navigation_index.dart';
import 'package:tlb_app/features/auth/presentation/pages/login_page.dart';
import 'package:tlb_app/my_app.dart';
import 'package:tlb_app/global_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reservation Page",
          style: TextStyleResource.appBarHeadline,
        ),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary,
        ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: profilePageIndex,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Main Content"),
            ElevatedButton(
                onPressed: () {
                  Supabase.instance.client.auth.signOut();
                  if (Supabase.instance.client.auth.currentSession == null) {
                    Navigator.pushReplacementNamed(
                        context, Routes.loginPage.name);
                  }
                },
                child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
