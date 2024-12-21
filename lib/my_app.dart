import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tlb_app/constants/navigations/navigation_router.dart';
import 'package:tlb_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/auth/presentation/pages/login_page.dart';
import 'package:tlb_app/features/auth/presentation/pages/onboarding_1_page.dart';
import 'package:tlb_app/features/catalogue/presentation/bloc/catalogue_bloc.dart';
import 'package:tlb_app/features/loyalty/presentation/bloc/loyalty_bloc.dart';
import 'package:tlb_app/features/loyalty/presentation/pages/loyalty_page.dart';
import 'package:tlb_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:tlb_app/features/profile/presentation/pages/profile_page.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/pages/reservation_page.dart';
import 'package:tlb_app/injection_container.dart';

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
    // Check whether the user is logged in or not.
    // If true, then onboarding will be skipped.

    // final Session? currentSession =
    //     Supabase.instance.client.auth.currentSession;
    // Widget homeWidget;
    // if (currentSession != null) {
    //   homeWidget = ReservationPage();
    // } else {
    //   homeWidget = OnboardingOnePage();
    // }

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      // routes: {
      //   Routes.onboardingTwoPage.name: (context) => const OnboardingTwoPage(),
      //   Routes.onboardingThreePage.name: (context) =>
      //       const OnboardingThreePage(),
      //   Routes.loginPage.name: (context) => const LoginPage(),
      //   Routes.reservationPage.name: (context) => const ReservationPage(),
      //   Routes.cataloguePage.name: (context) => const CataloguePage(),
      //   Routes.loyaltyPage.name: (context) => const LoyaltyPage(),
      //   Routes.profilePage.name: (context) => const ProfilePage(),
      // },
      // home: homeWidget,
    );
  }
}
