import 'package:equatable/equatable.dart';
import 'package:fpdart/src/either.dart';
import 'package:tlb_app/core/common/entities/user.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/core/usecases/usecase.dart';
import 'package:tlb_app/features/auth/domain/repositories/auth_repository.dart';

class UserUpdate extends Usecase<UserEntity, UpdateParams> {
  final AuthRepository repository;

  UserUpdate(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(params) async {
    return await repository.updateUser(
        params.userEntity, params.namaDepan, params.namaBelakang, params.noHp);
  }
}

class UpdateParams extends Equatable {
  final UserEntity userEntity;
  final String namaDepan;
  final String? namaBelakang;
  final String noHp;

  const UpdateParams(
      {required this.userEntity,
      required this.namaDepan,
      required this.namaBelakang,
      required this.noHp});

  @override
  List<Object?> get props => [userEntity, namaDepan, namaBelakang, noHp];
}
