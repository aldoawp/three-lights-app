import 'package:fpdart/fpdart.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/core/common/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> signInAnonymously();
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> currentUser();
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, UserEntity>> convertAnonToGoogle();
  Future<Either<Failure, UserEntity>> updateUser(UserEntity currentUser,
      String namaDepan, String? namaBelakang, String noHp);
}
