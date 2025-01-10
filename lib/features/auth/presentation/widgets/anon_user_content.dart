import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/auth/presentation/widgets/onboarding_button.dart';
import 'package:tlb_app/my_app.dart';

class AnonUserContent extends StatelessWidget {
  const AnonUserContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Please log in to access all features.',
              style: TextStyleResource.bodyBase,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              child: OnboardingButton(
                label: StringResource.loginWithGoogle,
                type: ButtonType.filled,
                icon: Icons.login,
                iconPosition: IconPosition.trailing,
                onPressedAction: () async {
                  context.read<AuthBloc>().add(UserLinkingAccountEvent());
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            // Login as a guest
            OutlinedButton.icon(
              onPressed: () async {
                context.read<AuthBloc>().add(UserSignOutEvent());
                // Supabase.instance.client.auth.signOut();
                // context.read<AuthBloc>().add(SignedOutEvent());
                // Navigator.pushReplacementNamed(
                //     context, Routes.loginPage.name);
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              iconAlignment: IconAlignment.end,
              label: const Text(
                "Keluar Akun",
                style: TextStyle(color: Colors.red),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: Colors.red[50], // Border color
                minimumSize: const Size.fromHeight(70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
