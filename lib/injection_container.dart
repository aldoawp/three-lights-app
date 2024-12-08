import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tlb_app/features/auth/data/datasources/auth_data_source.dart';
import 'package:tlb_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tlb_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:tlb_app/features/auth/domain/usecases/current_user.dart';
import 'package:tlb_app/features/auth/domain/usecases/user_sign_in_anonymous.dart';
import 'package:tlb_app/features/auth/domain/usecases/user_sign_in_google.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/reservation/data/datasources/reservation_remote_datasource.dart';
import 'package:tlb_app/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:tlb_app/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:tlb_app/features/reservation/domain/usecases/cancel_reservation.dart';
import 'package:tlb_app/features/reservation/domain/usecases/create_reservation.dart';
import 'package:tlb_app/features/reservation/domain/usecases/get_reservation_history.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Auth
  initAuth();
  initReservation();

  //! External
  final supabase = await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  sl.registerLazySingleton(
    () => supabase.client,
  );
}

void initAuth() {
  // Bloc
  sl.registerFactory(
    () => AuthBloc(
        userSignInAnonymously: sl(), userSignInGoogle: sl(), currentUser: sl()),
  );

  // UseCases
  sl.registerLazySingleton(
    () => CurrentUser(sl()),
  );
  sl.registerLazySingleton(
    () => UserSignInAnonymous(sl()),
  );
  sl.registerLazySingleton(
    () => UserSignInGoogle(sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );

  // DataSource
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(sl()),
  );
}

void initReservation() {
  // External dependencies
  sl.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: "http://192.168.137.1:3000/api")));

  // Data Layer
  sl.registerLazySingleton<ReservationRemoteDatasource>(
    () => ReservationRemoteDatasourceImpl(client: sl<Dio>()),
  );
  sl.registerLazySingleton<ReservationRepository>(
    () => ReservationRepositoryImpl(
        remoteDatasource: sl<ReservationRemoteDatasource>()),
  );

  // Domain Layer
  sl.registerLazySingleton(
      () => CreateReservation(sl<ReservationRepository>()));
  sl.registerLazySingleton(
      () => CancelReservation(sl<ReservationRepository>()));
  sl.registerLazySingleton(
      () => GetReservationHistory(sl<ReservationRepository>()));

  // Presentation Layer
  sl.registerFactory(() => ReservationBloc(
        createReservationEventsUseCase: sl<CreateReservation>(),
        cancelReservationEventsUseCase: sl<CancelReservation>(),
        getReservationHistoryUseCase: sl<GetReservationHistory>(),
      ));
}
