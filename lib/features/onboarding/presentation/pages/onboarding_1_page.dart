import 'package:flutter/material.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/hero_image.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:tlb_app/main.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

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
                            Navigator.pushNamed(
                                context, Routes.onboardingTwo.name);
                          },
                        )),
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
