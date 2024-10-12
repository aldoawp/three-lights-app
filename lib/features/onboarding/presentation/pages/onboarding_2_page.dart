import 'package:flutter/material.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/hero_image.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:tlb_app/my_app.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(ImageResource.onboardBg3), context);

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: ColorResource.bgWhite,
        constraints: constraints,
        child: Column(
          children: [
            const HeroImage(
              image: ImageResource.onboardBg2,
              imageSize: 2.1,
              decorBoxSize: 2.09,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const OnboardingContent(
                      headlineColored: StringResource.onboardTwoHeadlineColored,
                      headlineNonColored:
                          StringResource.onboardTwoHeadlineNonColored,
                      description: StringResource.onboardDesc2,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Row(
                          children: [
                            OnboardingButton(
                              label: StringResource.prevButton,
                              type: ButtonType.outlined,
                              icon: Icons.arrow_circle_left_outlined,
                              onPressedAction: () {
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            OnboardingButton(
                              label: StringResource.nextButton,
                              type: ButtonType.filled,
                              icon: Icons.arrow_circle_right,
                              onPressedAction: () {
                                Navigator.pushNamed(
                                    context, Routes.onboardingThree.name);
                              },
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
