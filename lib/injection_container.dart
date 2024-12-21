import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tlb_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:tlb_app/core/utils/scroll_position.dart';
import 'package:tlb_app/features/auth/data/datasources/auth_data_source.dart';
import 'package:tlb_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:tlb_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:tlb_app/features/auth/domain/usecases/current_user.dart';
import 'package:tlb_app/features/auth/domain/usecases/user_sign_in_anonymous.dart';
import 'package:tlb_app/features/auth/domain/usecases/user_sign_in_google.dart';
import 'package:tlb_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tlb_app/features/catalogue/data/datasources/catalogue_data_sources.dart';
import 'package:tlb_app/features/catalogue/data/repositories/catalogue_repository_impl.dart';
import 'package:tlb_app/features/catalogue/domain/repositories/catalogue_repository.dart';
import 'package:tlb_app/features/catalogue/domain/usecases/get_catalogue.dart';
import 'package:tlb_app/features/catalogue/domain/usecases/toggle_bookmark.dart';
import 'package:tlb_app/features/catalogue/presentation/bloc/catalogue_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Auth
  initAuth();

  //! Features - Catalogues
  initCatalogue();

  //! Core
  sl.registerLazySingleton(
    () => AppUserCubit(),
  );

  // Scroll Position
  sl.registerLazySingleton<ScrollPositionUtils>(
    () => ScrollPositionUtils(),
  );

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
        userSignInAnonymously: sl(),
        userSignInGoogle: sl(),
        currentUser: sl(),
        appUserCubit: sl()),
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

void initCatalogue() {
  // Bloc
  sl.registerFactory(
    () => CatalogueBloc(getCatalogue: sl(), toggleBookmark: sl()),
  );

  // UseCases
  sl.registerLazySingleton(
    () => GetCatalogue(sl()),
  );

  sl.registerLazySingleton(
    () => ToggleBookmark(sl()),
  );

  // Repository
  sl.registerLazySingleton<CatalogueRepository>(
    () => CatalogueRepositoryImpl(sl()),
  );

  // DataSource
  sl.registerLazySingleton<CatalogueDataSources>(
    () => CatalogueDataSourceImpl(sl()),
  );
}
