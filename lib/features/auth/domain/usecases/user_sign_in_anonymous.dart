import 'package:fpdart/src/either.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/core/usecases/usecase.dart';
import 'package:tlb_app/features/auth/domain/entities/user.dart';
import 'package:tlb_app/features/auth/domain/repositories/auth_repository.dart';

class UserSignInAnonymous extends Usecase<User, NoParams> {
  final AuthRepository repository;

  UserSignInAnonymous(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.signInAnonymously();
  }
}
