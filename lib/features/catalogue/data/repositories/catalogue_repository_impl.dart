import 'package:fpdart/fpdart.dart';
import 'package:tlb_app/core/error/exceptions.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/features/catalogue/data/datasources/catalogue_data_sources.dart';
import 'package:tlb_app/features/catalogue/data/models/catalogue_model.dart';
import 'package:tlb_app/features/catalogue/domain/entities/catalogue_entity.dart';
import 'package:tlb_app/features/catalogue/domain/repositories/catalogue_repository.dart';

class CatalogueRepositoryImpl implements CatalogueRepository {
  final CatalogueDataSources catalogueDataSources;

  CatalogueRepositoryImpl(this.catalogueDataSources);

  @override
  Future<Either<Failure, CatalogueEntity>> getCatalogue(String uid) async {
    try {
      final catalogue = await catalogueDataSources.getCatalogues(uid);
      return Right(catalogue);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, CatalogueEntity>> toggleBookmark(
      CatalogueEntity catalogue, String uid, int cid, bool isBook) async {
    try {
      final updatedCatalog = await catalogueDataSources.toggleBookmark(
          catalogue as CatalogueModel, uid, cid, isBook);
      return Right(updatedCatalog);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
