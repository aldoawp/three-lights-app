import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tlb_app/core/usecases/usecase.dart';
import 'package:tlb_app/features/auth/domain/entities/user.dart' as entity;
import 'package:tlb_app/features/auth/domain/usecases/current_user.dart';
import 'package:tlb_app/features/auth/domain/usecases/user_sign_in_anonymous.dart';
import 'package:tlb_app/features/auth/domain/usecases/user_sign_in_google.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignInAnonymous userSignInAnonymously;
  final UserSignInGoogle userSignInGoogle;
  final CurrentUser currentUser;

  AuthBloc(
      {required this.userSignInAnonymously,
      required this.userSignInGoogle,
      required this.currentUser})
      : super(AuthInitial()) {
    // _setUpAuthListener();
    // on<SignedInEvent>(_signedIn);
    // on<SignedOutEvent>(_signedOut);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
    on<UserSignInAnonymousEvent>(_onSignInAnonymous);
    on<UserSignInGoogleEvent>(_onSignInGoogle);
  }
  Future<void> _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final user = await currentUser.call(NoParams());
    user.fold(
      (failure) {
        return emit(AuthError(error: failure.message));
      },
      (user) {
        print(user);
        return emit(Authenticated(user: user));
      },
    );
  }

  Future<void> _onSignInAnonymous(
      UserSignInAnonymousEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await userSignInAnonymously.call(NoParams());

    res.fold(
      (failure) {
        return emit(AuthError(error: failure.message));
      },
      (user) {
        return emit(Authenticated(user: user));
      },
    );
  }

  Future<void> _onSignInGoogle(
      UserSignInGoogleEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await userSignInGoogle.call(NoParams());

    res.fold(
      (l) => emit(AuthError(error: l.message)),
      (r) => emit(Authenticated(user: r)),
    );
  }

  // void _setUpAuthListener() {
  //   supabase!.auth.onAuthStateChange.listen((data) {
  //     final event = data.event;
  //     if (event == AuthChangeEvent.signedIn) {
  //       add(SignedInEvent());
  //     } else if (event == AuthChangeEvent.signedOut) {
  //       add(SignedOutEvent());
  //     }
  //   });
  // }

  // void _signedIn(event, emit) {
  //   emit(Authenticated());
  // }

  // void _signedOut(event, emit) {
  //   emit(Unauthenticated());
}
