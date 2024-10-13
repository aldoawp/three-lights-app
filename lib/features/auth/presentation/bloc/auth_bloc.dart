import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SupabaseClient? supabase;

  AuthBloc([this.supabase]) : super(AuthInitial()) {
    supabase = Supabase.instance.client;
    _setUpAuthListener();
    on<GoogleSignInEvent>(_googleSignIn);
    on<AnonymousSignInEvent>(_anonymousSignIn);
    on<SignedInEvent>(_signedIn);
  }

  void _setUpAuthListener() {
    supabase!.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        add(SignedInEvent());
      }
    });
  }

  void _signedIn(event, emit) {
    emit(Authenticated());
  }

  Future<void> _googleSignIn(AuthEvent event, Emitter<AuthState> emit) async {
    try {
      final webClientId = dotenv.env['WEB_CLIENT_ID'];
      final iosClientId = dotenv.env['IOS_CLIENT_ID'];
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null || idToken == null) {
        emit(AuthError(error: "No access token or ID token found"));
        throw AuthException("No access token or ID token found");
      }

      await supabase!.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken);
    } catch (error) {
      emit(AuthError(error: error.toString()));
      throw AuthException(error.toString());
    }
  }

  Future<void> _anonymousSignIn(
      AuthEvent event, Emitter<AuthState> emit) async {
    await supabase!.auth.signInAnonymously();
  }
}
