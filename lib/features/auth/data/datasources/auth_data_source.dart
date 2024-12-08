import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tlb_app/core/error/exceptions.dart';
import 'package:tlb_app/features/auth/data/models/user_model.dart';

abstract interface class AuthDataSource {
  Session? get currentUserSession;
  Future<UserModel> signInAnonymously();
  Future<UserModel> signInWithGoogle();
  Future<UserModel?> getCurrentUserData();
}

class AuthDataSourceImpl implements AuthDataSource {
  final SupabaseClient supabaseClient;

  AuthDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signInAnonymously() async {
    try {
      final response = await supabaseClient.auth.signInAnonymously();
      if (response.session == null) {
        throw ServerException('Please try again later');
      }
      print(response.user?.toJson());
      final tes = response.user?.toJson();
      print(tes!['is_anonymous']);
      print(tes!['is_anonymous'].runtimeType);
      final userModel = UserModel.fromJson(response.user!.toJson());

      print(userModel);
      return userModel;
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final webClientId = dotenv.env['WEB_CLIENT_ID'];
    final iosClientId = dotenv.env['IOS_CLIENT_ID'];

    print('Supabase client: $supabaseClient');
    print(
        'Supabase auth currentSession: ${supabaseClient.auth.currentSession}');

    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      print(googleSignIn);

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw ServerException('Google sign-in cancelled.');
      }

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      print('...googleUser: $googleUser...');
      print('...googleUser: $googleAuth...');
      print('...googleUser: $accessToken...');
      print('...googleUser: $idToken...');

      if (accessToken == null) {
        throw ServerException('No Access Token found.');
      }
      if (idToken == null) {
        throw ServerException('No ID Token found.');
      }

      final response = await supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      print('...response: ${response.user}...');

      final userModel = UserModel.fromJson(response.user!.toJson());

      return userModel;
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final userData = currentUserSession;
        print('this session: $userData');

        final userModel = UserModel.fromJson(userData!.user.toJson());

        return userModel;
      }
      return null;
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
