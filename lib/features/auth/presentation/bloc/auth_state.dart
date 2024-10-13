part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class Authenticated extends AuthState {
  // final User? user;
  // dynamic profileImageUrl;
  // dynamic fullName;

  // Authenticated({
  //   required this.user,
  // }) {
  //   profileImageUrl = user?.userMetadata?['avatar_url'];
  //   fullName = user?.userMetadata?['full_name'];
  // }
}

final class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});
}
