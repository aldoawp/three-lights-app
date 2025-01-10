import 'package:fpdart/src/either.dart';
import 'package:tlb_app/core/error/exceptions.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/features/auth/data/datasources/auth_data_source.dart';
import 'package:tlb_app/features/auth/data/models/user_model.dart';
import 'package:tlb_app/core/common/entities/user.dart';
import 'package:tlb_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);
  @override
  Future<Either<Failure, UserEntity>> signInAnonymously() async {
    try {
      final guest = await authDataSource.signInAnonymously();
      return Right(guest);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await authDataSource.signInWithGoogle();
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> currentUser() async {
    try {
      final user = await authDataSource.getCurrentUserData();
      if (user == null) {
        return Left(Failure('Please log in first.'));
      }
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      final user = await authDataSource.signOut();
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> convertAnonToGoogle() async {
    try {
      final user = await authDataSource.convertAnonToGoogle();
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
