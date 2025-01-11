import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tlb_app/core/common/entities/user.dart';
import 'package:tlb_app/core/error/exceptions.dart';
import 'package:tlb_app/features/auth/data/models/user_model.dart';

abstract interface class AuthDataSource {
  Session? get currentUserSession;
  Future<UserModel> signInAnonymously();
  Future<UserModel> signInWithGoogle();
  Future<UserModel?> getCurrentUserData();
  Future<void> signOut();
  Future<UserModel> convertAnonToGoogle();
  Future<UserModel> updateUser(UserEntity userEntity, String namaDepan,
      String? namaBelakang, String noHp);
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
      print('...userModel: $userModel...');
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
    print(currentUserSession);
    try {
      if (currentUserSession != null) {
        final userData = await supabaseClient
            .from('auth_users_view')
            .select('*')
            .eq('id', currentUserSession!.user.id)
            .maybeSingle();
        print('this session: $userData');

        final userModel = UserModel.fromJson(currentUserSession!.user.toJson());

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

  @override
  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> convertAnonToGoogle() async {
    try {
      final isLinked =
          await supabaseClient.auth.linkIdentity(OAuthProvider.google);
      print('...isLinked: $isLinked...');

      if (!isLinked) {
        throw ServerException(
            'Failed to link anonymous user to Google account');
      }

      final currentUser = supabaseClient.auth.currentUser;
      print('...currentUser: $currentUser...');

      if (currentUser == null) {
        throw ServerException('User not found after linking');
      }

      final userModel = UserModel.fromJson(currentUser.toJson());
      print('...newUser: $userModel...');
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
  Future<UserModel> updateUser(UserEntity userEntity, String namaDepan,
      String? namaBelakang, String noHp) async {
    try {
      // Checking Data
      final oldNamaDepan = userEntity.name.split(' ')[0];
      final oldNamaBelakang = userEntity.name.split(' ').sublist(1).join(' ');
      final oldNoHp = userEntity.phone;

      // Mapping New Data
      final Map<String, dynamic> updatedAttributes = {};

      if (oldNamaDepan != namaDepan || oldNamaBelakang != namaBelakang) {
        final fullName = namaBelakang == null || namaBelakang.isEmpty
            ? namaDepan
            : "$namaDepan $namaBelakang";
        updatedAttributes['data'] = {'name': fullName};
      }

      if (oldNoHp != noHp) {
        updatedAttributes['phone'] = noHp;
      }

      if (updatedAttributes.isEmpty) {
        return userEntity as UserModel;
      }

      // final response = await supabaseClient.auth.updateUser(
      //   UserAttributes(
      //     phone: updatedAttributes['phone'],
      //     data: updatedAttributes['data'],
      //   ),
      // );

      final response = await supabaseClient.auth.admin.updateUserById(
        userEntity.uid,
        attributes: AdminUserAttributes(
          phone: updatedAttributes['phone'],
          userMetadata: {'name': updatedAttributes['name']},
        ),
      );

      print(response.user);

      if (response.user == null) {
        throw Exception('Failed to update user data');
      }

      final userModel = (userEntity as UserModel).copyWith(
        name: updatedAttributes['data'],
        phone: updatedAttributes['phone'],
      );

      print(userModel);
      return userModel;
    } on ServerException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
