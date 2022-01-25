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
        useSubThemes: true,
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

          //   bottomNavigationBarOpacity: 0.95,
          //   bottomNavigationBarElevation: 0,
          //   inputDecoratorIsFilled: true,
          // inputDecoratorBorderType: FlexInputBorderType.outline,
          // inputDecoratorUnfocusedHasBorder: true,
          // blendOnColors: true,
          blendTextTheme: true,
          // popupMenuOpacity: 0.95,
        ),
      );

  // static ThemeData get flexDarkBlue => FlexThemeData.dark(
  //       scheme: FlexScheme.ebonyClay,
  //       surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  //       blendLevel: 40,
  //       appBarStyle: FlexAppBarStyle.background,
  //       appBarOpacity: 0.83,
  //       appBarElevation: 24,
  //       transparentStatusBar: true,
  //       tabBarStyle: FlexTabBarStyle.universal,
  //       tooltipsMatchBackground: true,
  //       swapColors: false,
  //       darkIsTrueBlack: true,
  //       useSubThemes: true,
  //       visualDensity: FlexColorScheme.comfortablePlatformDensity,
  //       // To use playground font, add GoogleFonts package and uncomment:
  //       // fontFamily: GoogleFonts.notoSans().fontFamily,
  //       subThemesData: const FlexSubThemesData(
  //         useTextTheme: true,
  //         fabUseShape: true,
  //         interactionEffects: true,
  //         bottomNavigationBarOpacity: 0.95,
  //         bottomNavigationBarElevation: 0,
  //         inputDecoratorIsFilled: true,
  //         inputDecoratorBorderType: FlexInputBorderType.outline,
  //         inputDecoratorUnfocusedHasBorder: true,
  //         blendOnColors: true,
  //         blendTextTheme: true,
  //         popupMenuOpacity: 0.95,
  //       ),
  //     );

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
        useSubThemes: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        // To use this font, add GoogleFonts package and uncomment:
        fontFamily: GoogleFonts.rubik().fontFamily,

        subThemesData: const FlexSubThemesData(
          useTextTheme: true,
          fabUseShape: true,
          interactionEffects: true,

          //   bottomNavigationBarOpacity: 0.95,
          //   bottomNavigationBarElevation: 0,
          //   inputDecoratorIsFilled: true,
          // inputDecoratorBorderType: FlexInputBorderType.outline,
          // inputDecoratorUnfocusedHasBorder: true,
          // blendOnColors: true,
          blendTextTheme: true,
          // popupMenuOpacity: 0.95,
        ),
      );
}
