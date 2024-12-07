import 'package:fpdart/fpdart.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signInAnonymously();
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, User>> currentUser();
}
