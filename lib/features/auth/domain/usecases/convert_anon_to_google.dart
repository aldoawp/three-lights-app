import 'package:fpdart/src/either.dart';
import 'package:tlb_app/core/common/entities/user.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/core/usecases/usecase.dart';
import 'package:tlb_app/features/auth/domain/repositories/auth_repository.dart';

class ConvertAnonToGoogle extends Usecase<UserEntity, NoParams> {
  final AuthRepository repository;

  ConvertAnonToGoogle(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.convertAnonToGoogle();
  }
}
