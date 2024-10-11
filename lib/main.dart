import 'package:flutter/material.dart';
import 'package:tlb_app/features/onboarding/presentation/pages/onboarding_1_page.dart';
import 'package:tlb_app/features/onboarding/presentation/pages/onboarding_2_page.dart';
import 'package:tlb_app/features/onboarding/presentation/pages/onboarding_3_page.dart';
part 'constants/styles/text_style.dart';
part 'constants/styles/button_style.dart';
part 'constants/resources/color.dart';
part 'constants/resources/image.dart';
part 'constants/resources/string.dart';
part 'constants/enums/button_types.dart';
part 'constants/enums/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.onboardingTwo.name: (context) => const OnboardingTwo(),
        Routes.onboardingThree.name: (context) => const OnboardingThree(),
      },
      home: const OnboardingOne(),
    );
  }
}
