import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tlb_app/features/auth/presentation/pages/edit_profile_page.dart';
import '../../app_wrapper.dart';
import '../../core/common/cubits/app_user/app_user_cubit.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/onboarding_1_page.dart';
import '../../features/auth/presentation/pages/onboarding_2_page.dart';
import '../../features/auth/presentation/pages/onboarding_3_page.dart';
import '../../features/catalogue/presentation/pages/ask_ai_page.dart';
import '../../features/catalogue/presentation/pages/catalogue_page.dart';
import '../../features/catalogue/presentation/pages/favorite_page.dart';
import '../../features/loyalty/presentation/pages/loyalty_page.dart';
// import 'package:tlb_app/features/profile/presentation/pages/profile_page.dart';
import 'package:tlb_app/features/reservation/presentation/pages/reservation_page.dart';
import 'package:tlb_app/my_app.dart';

import '../../features/auth/presentation/pages/profile_page.dart';

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
      redirect: (context, state) async {
        print('fetching user');
        context.read<AuthBloc>().add(AuthIsUserLoggedIn());

        await for (final authState in context.read<AuthBloc>().stream) {
          print(authState.toString());
          if (authState is Authenticated) {
            print('User is authenticated');
            return '/reservation';
          }
          // return null;
          else if (authState is AuthError) {
            print('User is not authenticated');
            return null;
          }
        }
        return null;
        // final isAuth = context.read<AppUserCubit>().state;
        // if (isAuth is AppUserLoggedIn) {
        //   return '/reservation';
        // }
        // return null;
      },
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
              GoRoute(
                path: 'savedCatalogue',
                name: Routes.savedCataloguePage.name,
                builder: (context, state) => FavoritePage(),
              ),
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
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfile,
          routes: [
            GoRoute(
              path: '/profile',
              name: Routes.profilePage.name,
              builder: (context, state) => ProfilePage(),
              routes: [
                GoRoute(
                  path: 'editProfile',
                  name: Routes.editProfilePage.name,
                  builder: (context, state) => EditProfilePage(),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  ],
);
