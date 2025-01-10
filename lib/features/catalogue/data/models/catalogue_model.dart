import 'package:tlb_app/features/catalogue/domain/entities/catalogue_entity.dart';

class CatalogueModel extends CatalogueEntity {
  const CatalogueModel({required super.catalogues});

  factory CatalogueModel.fromJson(List<dynamic> json) {
    return CatalogueModel(
      catalogues: json
          .map((item) =>
              CatalogueListModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
  CatalogueModel copyWith({List<CatalogueListModel>? catalogues}) {
    return CatalogueModel(
      catalogues: catalogues ?? this.catalogues,
    );
  }
}

class CatalogueListModel extends CatalogueList {
  const CatalogueListModel(
      {required super.catalogueId,
      required super.styleName,
      required super.hairType,
      required super.description,
      required super.catalogueImages,
      required super.is_bookmarked});

  factory CatalogueListModel.fromJson(Map<String, dynamic> json) {
    return CatalogueListModel(
      catalogueId: json['catalogue_id'],
      styleName: json['style_name'],
      hairType: json['hair_type'],
      description: json['description'],
      catalogueImages: (json['catalogue_images'] as List)
          .map((item) => CatalogueImageModel.fromJson(item))
          .toList(),
      is_bookmarked: json['is_bookmarked'],
    );
  }
  CatalogueListModel copyWith({
    int? catalogueId,
    String? styleName,
    String? hairType,
    String? description,
    List<CatalogueImageModel>? catalogueImages,
    bool? is_bookmarked,
  }) {
    return CatalogueListModel(
      catalogueId: catalogueId ?? this.catalogueId,
      styleName: styleName ?? this.styleName,
      hairType: hairType ?? this.hairType,
      description: description ?? this.description,
      catalogueImages: catalogueImages ?? this.catalogueImages,
      is_bookmarked: is_bookmarked ?? this.is_bookmarked,
    );
  }
}

class CatalogueImageModel extends CatalogueImage {
  const CatalogueImageModel({required super.imageUrl});

  factory CatalogueImageModel.fromJson(Map<String, dynamic> json) {
    return CatalogueImageModel(
      imageUrl: json['image_url'],
    );
  }
  CatalogueImageModel copyWith({String? imageUrl}) {
    return CatalogueImageModel(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
