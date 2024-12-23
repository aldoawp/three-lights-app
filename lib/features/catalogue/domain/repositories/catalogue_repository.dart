import 'dart:ffi';

import 'package:fpdart/fpdart.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/features/catalogue/domain/entities/catalogue_entity.dart';

abstract interface class CatalogueRepository {
  Future<Either<Failure, CatalogueEntity>> getCatalogue(String uid);
  Future<Either<Failure, CatalogueEntity>> toggleBookmark(
      CatalogueEntity catalogue, String uid, int cid, bool isBook);
}
