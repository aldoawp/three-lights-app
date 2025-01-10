import 'package:equatable/equatable.dart';

class CatalogueEntity extends Equatable {
  final List<CatalogueList> catalogues;

  const CatalogueEntity({required this.catalogues});

  @override
  List<Object?> get props => [catalogues];
}

class CatalogueList extends Equatable {
  final int catalogueId;
  final String styleName;
  final String hairType;
  final String description;
  final List<CatalogueImage> catalogueImages;
  final bool is_bookmarked;

  const CatalogueList(
      {required this.catalogueId,
      required this.styleName,
      required this.hairType,
      required this.description,
      required this.catalogueImages,
      required this.is_bookmarked});

  @override
  List<Object?> get props => [
        catalogueId,
        styleName,
        hairType,
        description,
        catalogueImages,
        is_bookmarked
      ];
}

class CatalogueImage extends Equatable {
  final String imageUrl;

  const CatalogueImage({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}
