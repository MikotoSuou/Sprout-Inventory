import 'package:flutter/material.dart';
import 'package:sprout_inventory/res/styles.dart';
import 'colors.dart';
import 'fonts.dart';
import 'values.dart' as values;

ThemeData get applicationTheme => ThemeData(
  useMaterial3: true,
  primaryColor: ColorManager.primary,
  primaryColorLight: ColorManager.primary,
  primaryColorDark: ColorManager.primary,
  disabledColor: ColorManager.grey,
  scaffoldBackgroundColor: ColorManager.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorManager.white),
  cardTheme: _cardTheme,
  textTheme: _textTheme,
);


/// card theme
CardTheme get _cardTheme => CardTheme(
  color: ColorManager.white,
  surfaceTintColor: ColorManager.white,
  elevation: values.Size.s3,
  margin: EdgeInsets.zero,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(values.Size.s8)),
);


/// text theme
TextTheme get _textTheme => TextTheme(
  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals.
  displayLarge: boldTextStyle(color: ColorManager.black, fontSize: FontSize.s18), // bold black
  displayMedium: mediumTextStyle(color: ColorManager.black, fontSize: FontSize.s14), // medium black
  displaySmall: regularTextStyle(color: ColorManager.grey, fontSize: FontSize.s14), // hints / disabled

  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text.
  headlineLarge: boldTextStyle(color: ColorManager.white, fontSize: FontSize.s18),
  headlineMedium: boldTextStyle(color: ColorManager.white, fontSize: FontSize.s18),
  headlineSmall: regularTextStyle(color: ColorManager.white, fontSize: FontSize.s12),

  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  titleLarge: boldTextStyle(color: ColorManager.primary, fontSize: FontSize.s20),
  titleMedium: boldTextStyle(color: ColorManager.primary, fontSize: FontSize.s18),
  titleSmall: boldTextStyle(color: ColorManager.black, fontSize: FontSize.s14), // label

  /// Use for button text
  labelLarge: boldTextStyle(color: ColorManager.white, fontSize: FontSize.s14), // bold white 14
  labelMedium: boldTextStyle(color: ColorManager.black, fontSize: FontSize.s14), // bold white 14
  labelSmall: boldTextStyle(color: ColorManager.primary, fontSize: FontSize.s14), // highlighted texts

  /// Use in long messages / text
  bodyLarge: regularTextStyle(color: ColorManager.white, fontSize: FontSize.s14), // regular white 14
  bodyMedium: regularTextStyle(color: ColorManager.black, fontSize: FontSize.s14), // regular black 14
  bodySmall: regularTextStyle(color: ColorManager.black, fontSize: FontSize.s12), // descriptions
);