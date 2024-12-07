import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/app_wrapper.dart';
import 'package:tlb_app/constants/navigations/navigation_router.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/auth/presentation/widgets/hero_image.dart';
import 'package:tlb_app/features/auth/presentation/widgets/onboarding_button.dart';
import 'package:tlb_app/features/auth/presentation/widgets/onboarding_content.dart';
import 'package:tlb_app/my_app.dart';

class OnboardingOnePage extends StatelessWidget {
  const OnboardingOnePage({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(ImageResource.onboardBg2), context);

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: ColorResource.bgWhite,
        constraints: constraints,
        child: Column(
          children: [
            const HeroImage(
              image: ImageResource.onboardBg1,
              imageSize: 1.9,
              decorBoxSize: 1.9,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const OnboardingContent(
                      headlineColored: StringResource.onboardOneHeadlineColored,
                      headlineNonColored:
                          StringResource.onboardOneHeadlineNonColored,
                      description: StringResource.onboardDesc1,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: OnboardingButton(
                        label: StringResource.nextButton,
                        type: ButtonType.filled,
                        icon: Icons.arrow_circle_right,
                        onPressedAction: () {
                          // Navigator.pushNamed(
                          //     context, Routes.onboardingTwoPage.name);
                          context.pushNamed(Routes.onboardingTwoPage.name);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }));
  }
}
