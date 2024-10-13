import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:tlb_app/features/auth/presentation/pages/login_page.dart';
import 'package:tlb_app/features/catalogue/presentation/pages/catalogue_page.dart';
import 'package:tlb_app/features/loyalty/presentation/pages/loyalty_page.dart';
import 'package:tlb_app/features/onboarding/presentation/pages/onboarding_1_page.dart';
import 'package:tlb_app/features/onboarding/presentation/pages/onboarding_2_page.dart';
import 'package:tlb_app/features/onboarding/presentation/pages/onboarding_3_page.dart';
import 'package:tlb_app/features/profile/presentation/pages/profile_page.dart';
import 'package:tlb_app/features/reservation/presentation/pages/reservation_page.dart';

part 'constants/styles/text_style.dart';
part 'constants/styles/button_style.dart';
part 'constants/resources/color.dart';
part 'constants/resources/image.dart';
part 'constants/resources/string.dart';
part 'constants/enums/button_types.dart';
part 'constants/enums/routes.dart';
part 'constants/enums/icon_position.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.onboardingTwoPage.name: (context) => const OnboardingTwoPage(),
        Routes.onboardingThreePage.name: (context) =>
            const OnboardingThreePage(),
        Routes.loginPage.name: (context) => const OnboardingThreePage(),
        Routes.reservationPage.name: (context) => const ReservationPage(),
        Routes.cataloguePage.name: (context) => const CataloguePage(),
        Routes.loyaltyPage.name: (context) => const LoyaltyPage(),
        Routes.profilePage.name: (context) => const ProfilePage(),
      },
      home: const ReservationPage(),
    );
  }
}
