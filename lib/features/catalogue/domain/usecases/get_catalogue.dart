import 'package:equatable/equatable.dart';
import 'package:fpdart/src/either.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/core/usecases/usecase.dart';
import 'package:tlb_app/features/catalogue/domain/entities/catalogue_entity.dart';
import 'package:tlb_app/features/catalogue/domain/repositories/catalogue_repository.dart';

class GetCatalogue extends Usecase<CatalogueEntity, GetCatalogueParams> {
  final CatalogueRepository repository;

  GetCatalogue(this.repository);

  @override
  Future<Either<Failure, CatalogueEntity>> call(params) async {
    return await repository.getCatalogue(params.uid);
  }
}

class GetCatalogueParams extends Equatable {
  final String uid;

  const GetCatalogueParams({required this.uid});

  @override
  List<Object?> get props => [uid];
}
