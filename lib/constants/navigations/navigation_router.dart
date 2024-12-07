import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/app_wrapper.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/auth/presentation/pages/login_page.dart';
import 'package:tlb_app/features/auth/presentation/pages/onboarding_1_page.dart';
import 'package:tlb_app/features/auth/presentation/pages/onboarding_2_page.dart';
import 'package:tlb_app/features/auth/presentation/pages/onboarding_3_page.dart';
import 'package:tlb_app/features/catalogue/presentation/pages/ask_ai_page.dart';
import 'package:tlb_app/features/catalogue/presentation/pages/catalogue_page.dart';
import 'package:tlb_app/features/loyalty/presentation/pages/loyalty_page.dart';
import 'package:tlb_app/features/profile/presentation/pages/profile_page.dart';
import 'package:tlb_app/features/reservation/presentation/pages/reservation_page.dart';
import 'package:tlb_app/my_app.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorReservation = GlobalKey<NavigatorState>();
final _shellNavigatorCatalogue = GlobalKey<NavigatorState>();
final _shellNavigatorLoyalty = GlobalKey<NavigatorState>();
final _shellNavigatorProfile = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/onboarding_1',
    routes: [
      GoRoute(
        path: '/onboarding_1',
        name: Routes.onboardingOnePage.name,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => OnboardingOnePage(),
      ),
      GoRoute(
        path: '/onboarding_2',
        name: Routes.onboardingTwoPage.name,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => OnboardingTwoPage(),
      ),
      GoRoute(
        path: '/onboarding_3',
        name: Routes.onboardingThreePage.name,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => OnboardingThreePage(),
      ),
      GoRoute(
        path: '/login',
        parentNavigatorKey: _rootNavigatorKey,
        name: Routes.loginPage.name,
        builder: (context, state) => LoginPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorReservation,
            routes: [
              GoRoute(
                path: '/reservation',
                name: Routes.reservationPage.name,
                builder: (context, state) => ReservationPage(),
                // routes: [
                //   GoRoute(
                //     path: 'booking',
                //     name: Routes.bookingPage.name,
                //     //! need builder for /reservation/booking
                //   ),
                // ],
              ),
            ],
          ),
          StatefulShellBranch(navigatorKey: _shellNavigatorCatalogue, routes: [
            GoRoute(
              path: '/catalogue',
              name: Routes.cataloguePage.name,
              builder: (context, state) => CataloguePage(),
              routes: [
                //   GoRoute(
                //     path: 'savedCatalogue',
                //     name: Routes.savedCataloguePage.name,
                //     //! need builder for /catalogue/savedCatalogue
                //   ),
                GoRoute(
                  path: 'askAI',
                  name: Routes.askAiPage.name,
                  builder: (context, state) => AskAiPage(),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorLoyalty, routes: [
            GoRoute(
              path: '/loyalty',
              name: Routes.loyaltyPage.name,
              builder: (context, state) => LoyaltyPage(),
            ),
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorProfile, routes: [
            GoRoute(
              path: '/profile',
              name: Routes.profilePage.name,
              builder: (context, state) => ProfilePage(),
              // routes: [
              //   GoRoute(
              //     path: 'editProfile',
              //     name: Routes.editProfilePage.name,
              //     //! need to build /profile/editProfile
              //   ),
              // ],
            ),
          ])
        ],
      ),
    ]);
