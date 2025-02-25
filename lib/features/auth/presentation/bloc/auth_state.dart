part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];

  get user => null;
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final UserEntity user;

  Authenticated({required this.user});
}

final class Unauthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String error;

  const AuthError({required this.error});
}
