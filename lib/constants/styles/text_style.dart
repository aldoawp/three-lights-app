part of '../../my_app.dart';

class TextStyleResource {
  static const TextStyle headingXL = TextStyle(
    color: ColorResource.text,
    fontFamily: 'Inter',
    fontWeight: FontWeight.bold,
    fontSize: 40.0,
  );
  static const TextStyle appBarHeadline = TextStyle(
    color: ColorResource.offWhite,
    fontFamily: 'Inter',
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

extension StringCasingExtension on String {
  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');
  String get firstTwoWords {
    final words = split(' ');
    return words.length >= 2 ? '${words[0]} ${words[1]}' : this;
  }
}
