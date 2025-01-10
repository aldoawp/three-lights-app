import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/catalogue/presentation/bloc/catalogue_bloc.dart';
import 'package:tlb_app/features/loyalty/presentation/bloc/loyalty_bloc.dart';
import 'package:tlb_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tlb_app/injection_container.dart';
import 'package:tlb_app/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  // SupabaseService.instantiateSupabase();
  await di.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AppUserCubit>(
        create: (context) => sl<AppUserCubit>(),
      ),
      BlocProvider<AuthBloc>(create: (BuildContext context) => sl<AuthBloc>()),
      BlocProvider(create: (BuildContext context) => ReservationBloc()),
      BlocProvider(create: (BuildContext context) => sl<CatalogueBloc>()),
      BlocProvider(create: (BuildContext context) => LoyaltyBloc()),
      BlocProvider(create: (BuildContext context) => ProfileBloc()),
    ],
    child: MyApp(),
  ));
}
