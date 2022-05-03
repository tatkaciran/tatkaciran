import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemePreset {
  static ThemeData get flexlight => FlexThemeData.light(
        scheme: FlexScheme.hippieBlue,

        // surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 40,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.95,
        appBarElevation: 0,
        transparentStatusBar: true,

        tabBarStyle: FlexTabBarStyle.forAppBar,

        // tooltipsMatchBackground: true,
        swapColors: false,

        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use this font, add GoogleFonts package and uncomment:
        fontFamily: GoogleFonts.rubik().fontFamily,
        primary: Colors.indigo[900],
        secondary: Colors.indigo[900],

        scaffoldBackground: Colors.grey[100],

        subThemesData: const FlexSubThemesData(
          cardElevation: 0,
          useTextTheme: true,
          fabUseShape: true,
          interactionEffects: true,
          blendTextTheme: true,
        ),
      );

  static ThemeData get flexDarkBlue => FlexThemeData.dark(
        scheme: FlexScheme.hippieBlue,
        primary: Colors.indigo[900],
        secondary: Colors.indigo[900],

        // surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 40,
        appBarStyle: FlexAppBarStyle.background,
        appBarOpacity: 0.95,
        appBarElevation: 0,
        transparentStatusBar: true,

        tabBarStyle: FlexTabBarStyle.forAppBar,

        // tooltipsMatchBackground: true,
        swapColors: false,
        darkIsTrueBlack: true,

        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use this font, add GoogleFonts package and uncomment:
        fontFamily: GoogleFonts.rubik().fontFamily,

        subThemesData: const FlexSubThemesData(
          useTextTheme: true,
          fabUseShape: true,
          interactionEffects: true,
          blendTextTheme: true,
        ),
      );
}
