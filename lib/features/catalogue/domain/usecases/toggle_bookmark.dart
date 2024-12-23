import 'package:equatable/equatable.dart';
import 'package:fpdart/src/either.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/core/usecases/usecase.dart';
import 'package:tlb_app/features/catalogue/domain/entities/catalogue_entity.dart';
import 'package:tlb_app/features/catalogue/domain/repositories/catalogue_repository.dart';

class ToggleBookmark extends Usecase<CatalogueEntity, ToggleBookmarkParams> {
  final CatalogueRepository repository;

  ToggleBookmark(this.repository);

  @override
  Future<Either<Failure, CatalogueEntity>> call(params) async {
    return await repository.toggleBookmark(
        params.catalogueEntity, params.uid, params.cid, params.isBook);
  }
}

class ToggleBookmarkParams extends Equatable {
  final CatalogueEntity catalogueEntity;
  final String uid;
  final int cid;
  final bool isBook;

  ToggleBookmarkParams(
      {required this.catalogueEntity,
      required this.uid,
      required this.cid,
      required this.isBook});

  @override
  List<Object?> get props => [catalogueEntity, uid, cid, isBook];
}
