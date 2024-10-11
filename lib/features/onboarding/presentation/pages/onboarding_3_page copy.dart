import 'package:flutter/material.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/hero_image.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:tlb_app/main.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: ColorResource.bgWhite,
        constraints: constraints,
        child: const Column(
          children: [
            HeroImage(
              image: ImageResource.onboardBg3,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OnboardingContent(
                      headlineColored:
                          StringResource.onboardThreeHeadlineColored,
                      headlineNonColored:
                          StringResource.onboardThreeHeadlineNonColored,
                      description: StringResource.onboardDesc3,
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Row(
                          children: [
                            OnboardingButton(
                              label: StringResource.prevButton,
                              type: ButtonType.outlined,
                              icon: Icons.arrow_circle_left_outlined,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            OnboardingButton(
                              label: StringResource.nextButton,
                              type: ButtonType.filled,
                              icon: Icons.arrow_circle_right,
                            ),
                          ],
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
