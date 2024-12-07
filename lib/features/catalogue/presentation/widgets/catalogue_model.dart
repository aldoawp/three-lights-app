import 'package:flutter/material.dart';

class CatalogueModel {
  final IconData iconData;
  final String hairModel;
  final String hairLength;

  CatalogueModel(
      {required this.iconData,
      required this.hairModel,
      required this.hairLength});
}

class CatalogueData {
  final catalogueData = [
    CatalogueModel(
        iconData: Icons.person_2_rounded,
        hairModel: 'Man Braid',
        hairLength: 'Pendek'),
    CatalogueModel(
        iconData: Icons.person_2_rounded,
        hairModel: 'DreadLocks',
        hairLength: 'Sedang'),
    CatalogueModel(
        iconData: Icons.person_2_rounded,
        hairModel: 'Short Back and Sides',
        hairLength: 'Sedang'),
    CatalogueModel(
        iconData: Icons.person_2_rounded,
        hairModel: 'Shaved Sides',
        hairLength: 'Sedang'),
    CatalogueModel(
        iconData: Icons.person_2_rounded,
        hairModel: 'Mid Fade',
        hairLength: 'Sedang'),
    CatalogueModel(
        iconData: Icons.person_2_rounded,
        hairModel: 'Bowl Cut',
        hairLength: 'Sedang'),
  ];
}
