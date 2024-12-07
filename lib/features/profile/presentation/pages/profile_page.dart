import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tlb_app/constants/navigations/navigation_index.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:tlb_app/my_app.dart';
import 'package:tlb_app/global_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: ProfileBloc(),
        builder: (context, state) {
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
            // bottomNavigationBar: NavBar(
            //   currentIndex: profilePageIndex,
            // ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Main Content"),
                  ElevatedButton(
                      onPressed: () {
                        Supabase.instance.client.auth.signOut();
                        context.read<AuthBloc>().add(SignedOutEvent());
                        Navigator.pushReplacementNamed(
                            context, Routes.loginPage.name);
                      },
                      child: Text("Logout")),
                ],
              ),
            ),
          );
        });
  }
}
