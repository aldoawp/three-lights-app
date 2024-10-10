import 'package:flutter/material.dart';
import 'package:tlb_app/main.dart';
part '../widgets/hero_image.dart';

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: StringResource.onboardOneHeadlineColored,
                              style: TextStyleResource.heading_xl
                                  .copyWith(color: ColorResource.primary)),
                          const TextSpan(
                              text: StringResource.onboardOneHeadlineNonColored,
                              style: TextStyleResource.heading_xl),
                        ])),
                        const SizedBox(height: 24.0),
                        Container(
                          color: ColorResource.text,
                          height: 1,
                          width: 60,
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          StringResource.onboardDesc1,
                          style: TextStyleResource.body_base,
                        ),
                      ],
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
