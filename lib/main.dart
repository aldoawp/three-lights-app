import 'package:flutter/material.dart';
import 'package:tlb_app/features/onboarding/presentation/pages/onboarding_1_page.dart';
import 'package:tlb_app/features/onboarding/presentation/pages/onboarding_2_page.dart';
import 'package:tlb_app/features/onboarding/presentation/pages/onboarding_3_page%20copy.dart';
part 'constants/text_style.dart';
part 'constants/button_style.dart';
part 'constants/color.dart';
part 'constants/image.dart';
part 'constants/string.dart';
part 'constants/enum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingTwo(),
    );
  }
}
