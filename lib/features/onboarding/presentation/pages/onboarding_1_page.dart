import 'package:flutter/material.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/hero_image.dart';
import 'package:tlb_app/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:tlb_app/main.dart';

class OnboardingOne extends StatelessWidget {
  const OnboardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: ColorResource.bgWhite,
        constraints: constraints,
        child: Column(
          children: [
            const HeroImage(
              image: ImageResource.onboardBg1,
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
                      child: FilledButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            iconSize: WidgetStatePropertyAll(24),
                            textStyle:
                                WidgetStatePropertyAll(TextStyle(fontSize: 16)),
                            minimumSize: WidgetStatePropertyAll(Size(0, 70)),
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xFF588B78)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Lanjut"),
                            Icon(Icons.arrow_right),
                          ],
                        ),
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
