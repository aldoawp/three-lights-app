part of '../main.dart';

class TextStyleResource {
  static const TextStyle headingXL = TextStyle(
    color: ColorResource.text,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontSize: 40.0,
  );
  static const TextStyle bodyBase = TextStyle(
    color: ColorResource.text,
    fontFamily: 'Inter',
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );

  static const TextStyle buttonFilledLabel = TextStyle(
    color: ColorResource.offWhite,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  static const TextStyle buttonOutlinedLabel = TextStyle(
    color: ColorResource.primary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );
}
