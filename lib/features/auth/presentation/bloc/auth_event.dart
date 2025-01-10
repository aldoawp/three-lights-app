part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// final class GoogleSignInEvent extends AuthEvent {}

// final class AnonymousSignInEvent extends AuthEvent {}

// final class SignedOutEvent extends AuthEvent {}

// final class SignedInEvent extends AuthEvent {}

final class AuthIsUserLoggedIn extends AuthEvent {}

final class UserSignInAnonymousEvent extends AuthEvent {}

final class UserSignInGoogleEvent extends AuthEvent {}

final class UserSignOutEvent extends AuthEvent {}

final class UserLinkingAccountEvent extends AuthEvent {}
