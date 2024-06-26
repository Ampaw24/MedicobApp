import 'package:flutter/material.dart';

import '../pref_utils.dart';


class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  PrimaryColors _getThemeColors() {
        if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme = _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.secondaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadowColor: colorScheme.primary,
          elevation: 4,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.whiteA700,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        displayMedium: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 50,
          fontFamily: 'Atma',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 32,
          fontFamily: 'Atma',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: appTheme.gray900,
          fontSize: 28,
          fontFamily: 'Atma',
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 24,
          fontFamily: 'Atkinson Hyperlegible',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: colorScheme.primary.withOpacity(1),
          fontSize: 20,
          fontFamily: 'Atma',
          fontWeight: FontWeight.w500,
        ),
      );
}
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0X3F000000),
    primaryContainer: Color(0XFF1E1E1E),
    secondaryContainer: Color(0XFFFF4A5F),

    // Error colors
    onError: Color(0XFFFFD400),

    // On colors(text colors)
    onPrimary: Color(0XFF242424),
    onPrimaryContainer: Color(0XFFFED402),
  );
}
class PrimaryColors {
  // BlueGray
  Color get blueGray100 =>const Color(0XFFD9D9D9);
  // Gray
  Color get gray50 =>const Color(0XFFFAFAFA);
  Color get gray900 =>const Color(0XFF222424);

  // LightBlue
  Color get lightBlue50 =>const Color(0XFFE9FCFF);

  // Red
  Color get red500 =>const Color(0XFFF63636);
  Color get redA200 =>const Color(0XFFFF4A4A);

  // White
  Color get whiteA700 =>const Color(0XFFFFFFFF);

  // Yellow
  Color get yellow600 =>const Color(0XFFFFD72E);
}

PrimaryColors get  appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
