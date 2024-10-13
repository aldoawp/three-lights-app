import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/hero_image.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:tlb_app/my_app.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(ImageResource.onboardBg2), context);

    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.reservationPage.name,
            (route) => false,
          );
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          color: ColorResource.bgWhite,
          constraints: constraints,
          child: Column(
            children: [
              const HeroImage(
                image: ImageResource.loginBg,
                imageSize: 1.8,
                decorBoxSize: 1.8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const OnboardingContent(
                        headlineNonColored: StringResource.loginHeadline,
                        description: StringResource.loginDesc,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Column(
                          children: [
                            // Login with Google
                            SizedBox(
                              child: OnboardingButton(
                                label: StringResource.loginWithGoogle,
                                type: ButtonType.filled,
                                icon: Icons.login,
                                iconPosition: IconPosition.trailing,
                                onPressedAction: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(GoogleSignInEvent());
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            // Login as a guest
                            SizedBox(
                              child: OnboardingButton(
                                label: StringResource.loginAsGuest,
                                icon: Icons.person_outline_outlined,
                                iconPosition: IconPosition.trailing,
                                type: ButtonType.outlined,
                                onPressedAction: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(AnonymousSignInEvent());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    ));
  }
}
