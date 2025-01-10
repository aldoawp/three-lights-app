part of 'catalogue_bloc.dart';

abstract class CatalogueEvent extends Equatable {
  const CatalogueEvent();

  @override
  List<Object> get props => [];
}

final class GetCataloguesEvent extends CatalogueEvent {
  final String uid;

  const GetCataloguesEvent(this.uid);
}

final class ToggleBookmarkEvent extends CatalogueEvent {
  final CatalogueEntity catalogueEntity;
  final String uid;
  final int cid;
  final bool isBook;

  const ToggleBookmarkEvent(
      this.catalogueEntity, this.uid, this.cid, this.isBook);
}
