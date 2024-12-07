import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/app_wrapper.dart';
import 'package:tlb_app/features/auth/presentation/widgets/hero_image.dart';
import 'package:tlb_app/features/auth/presentation/widgets/onboarding_button.dart';
import 'package:tlb_app/features/auth/presentation/widgets/onboarding_content.dart';
import 'package:tlb_app/my_app.dart';

class OnboardingThreePage extends StatelessWidget {
  const OnboardingThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(ImageResource.loginBg), context);

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: ColorResource.bgWhite,
        constraints: constraints,
        child: Column(
          children: [
            const HeroImage(
              image: ImageResource.onboardBg3,
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
                      headlineColored:
                          StringResource.onboardThreeHeadlineColored,
                      headlineNonColored:
                          StringResource.onboardThreeHeadlineNonColored,
                      description: StringResource.onboardDesc3,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: OnboardingButton(
                                label: StringResource.prevButton,
                                type: ButtonType.outlined,
                                icon: Icons.arrow_circle_left_outlined,
                                iconPosition: IconPosition.leading,
                                onPressedAction: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: OnboardingButton(
                                label: StringResource.nextButton,
                                type: ButtonType.filled,
                                icon: Icons.arrow_circle_right,
                                onPressedAction: () {
                                  // Navigator.pushNamed(
                                  //     context, Routes.loginPage.name);
                                  context.pushNamed(Routes.loginPage.name);
                                },
                              ),
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
