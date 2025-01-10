import 'package:fpdart/src/either.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/core/usecases/usecase.dart';
import 'package:tlb_app/features/auth/domain/repositories/auth_repository.dart';

class UserSignOut extends Usecase<void, NoParams> {
  final AuthRepository repository;

  UserSignOut(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.signOut();
  }
}
