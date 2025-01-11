import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/constants/navigations/navigation_router.dart';
import 'package:tlb_app/core/common/widgets/loader.dart';
import 'package:tlb_app/core/utils/show_snackbar.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/auth/presentation/widgets/anon_user_content.dart';
import 'package:tlb_app/features/auth/presentation/widgets/google_user_content.dart';
import 'package:tlb_app/my_app.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile Page",
          style: TextStyleResource.appBarHeadline,
        ),
        toolbarHeight: 80,
        flexibleSpace: Container(
          color: ColorResource.primary, // Primary color
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              context.goNamed(Routes.onboardingOnePage.name);
            }
            if (state is AuthError) {
              showSnackBar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Loader();
            }
            if (state is Authenticated) {
              if (state.user.isAnonymously) {
                // return Center(
                //   child: Text('Sign In First'),
                // );
                return AnonUserContent();
              } else {
                return GoogleUserContent();
              }
            }
            // return GoogleUserContent();
            // return AnonUserContent();
            return Container();
          },
        ),
      ),
    );
  }
}
