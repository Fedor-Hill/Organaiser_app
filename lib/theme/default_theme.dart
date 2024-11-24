import 'package:flutter/material.dart';

// This color from Carppuccin scheme
// https://github.com/catppuccin/catppuccin


//---------------#ColorScheme#------------------------------------//
const Color primaryDark = Color.fromARGB(255, 203, 166, 247);
const Color primaryLight = Color.fromARGB(255, 136, 57, 239);

const Color secondaryDark = Color.fromARGB(255, 148, 226, 213);
const Color secondaryLight = Color.fromARGB(255, 23, 146, 153);

const Color errorDark = Color.fromARGB(255, 243, 139, 168);
const Color errorLight = Color.fromARGB(255, 210, 15, 57);

const Color backgroundDark = Color.fromARGB(255, 30, 30, 46);
const Color backgroundLight = Color.fromARGB(255, 239, 241, 245);

const Color onBackgroundDark = Color.fromARGB(255, 17, 17, 27);
const Color onBackgroundLight = Color.fromARGB(255, 220, 224, 232);

const Color surfaceDark = Color.fromARGB(255, 49, 50, 68);
const Color surfaceLight = Color.fromARGB(255, 204, 208, 218);

//---------------#TextTheme#------------------------------------//
const String fontMain = "Comforta";
const Color textDark = Color.fromARGB(255, 205, 214, 244);
const Color textLight = Color.fromARGB(255, 76, 79, 105);

const Color subTextDark = Color.fromARGB(255, 186, 194, 222);
const Color subTextLight = Color.fromARGB(255, 92, 95, 119);

//---------------#MarkTheme#------------------------------------//
const Color textMarkDark = Color.fromARGB(255, 17, 17, 27);
const Color goodMarkDark = Color.fromARGB(255, 166, 227, 161);
const Color averageMarkDark = Color.fromARGB(255, 250, 179, 135);
const Color badMarkDark = Color.fromARGB(255, 243, 139, 168);

const Color textMarkLight = Color.fromARGB(255, 220, 224, 232);
const Color goodMarkLight = Color.fromARGB(255, 64, 160, 43);
const Color averageMarkLight = Color.fromARGB(255, 254, 100, 11);
const Color badMarkLight = Color.fromARGB(255, 210, 15, 57);

ThemeData defaultDark = ThemeData(

  extensions: const <ThemeExtension<dynamic>>[
    MarkColor(
      text: textMarkDark,
      good: goodMarkDark,
      bad: badMarkDark,
      average: averageMarkDark)
  ],

  colorScheme: const ColorScheme.dark(
    primary: primaryDark,
    secondary: secondaryDark,
    error: errorDark,
    background: backgroundDark,
    onBackground: onBackgroundDark,
    surface: surfaceDark
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: onBackgroundDark,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: textDark
    )
  ),

  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(fontFamily: fontMain, color: textDark),
    unselectedLabelStyle: TextStyle(fontFamily: fontMain, color: subTextDark)
  ),

  dividerTheme: const DividerThemeData(
    color: primaryDark
  ),

  cardTheme: const CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    shadowColor: null,
    surfaceTintColor: null,
    color: surfaceDark
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: onBackgroundDark
  ),

  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: onBackgroundDark,
    indicatorColor: primaryDark,
    surfaceTintColor: null,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide
  ),

  navigationRailTheme: const NavigationRailThemeData(
    backgroundColor: onBackgroundDark,
    labelType: NavigationRailLabelType.none,
    groupAlignment: 0,
    indicatorColor: primaryDark
  ),

  listTileTheme: const ListTileThemeData(
    tileColor: surfaceDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: primaryDark)
    ),
    iconColor: primaryDark
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(fontFamily: fontMain, color: textDark),
    displayMedium: TextStyle(fontFamily: fontMain, color: textDark),
    displaySmall: TextStyle(fontFamily: fontMain, color: textDark),

    titleLarge: TextStyle(fontFamily: fontMain, color: textDark),
    titleMedium: TextStyle(fontFamily: fontMain, color: textDark),
    titleSmall: TextStyle(fontFamily: fontMain, color: textDark),

    bodyLarge: TextStyle(fontFamily: fontMain, color: subTextDark),
    bodyMedium: TextStyle(fontFamily: fontMain, color: subTextDark),
    bodySmall: TextStyle(fontFamily: fontMain, color: subTextDark)
  ),

  iconTheme: const IconThemeData(
    color: textDark
  )
);


ThemeData defaultLight = ThemeData(

  extensions: const <ThemeExtension<dynamic>>[
    MarkColor(
      text: textMarkLight,
      good: goodMarkLight,
      bad:  badMarkLight,
      average: averageMarkLight)
  ],

  colorScheme: const ColorScheme.light(
    primary: primaryLight,
    secondary: secondaryLight,
    error: errorLight,
    background: backgroundLight,
    onBackground: onBackgroundLight,
    surface: surfaceLight
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: onBackgroundLight,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: textLight
    )
  ),

  tabBarTheme: const TabBarTheme(
    labelStyle: TextStyle(fontFamily: fontMain, color: textLight),
    unselectedLabelStyle: TextStyle(fontFamily: fontMain, color: subTextLight),
  ),

  dividerTheme: const DividerThemeData(
    color: primaryLight
  ),

  cardTheme: const CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    shadowColor: onBackgroundDark,
    surfaceTintColor: null,
    color: surfaceLight
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: onBackgroundLight
  ),

  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: onBackgroundLight,
    indicatorColor: primaryLight,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide
  ),

  navigationRailTheme: const NavigationRailThemeData(
    backgroundColor: onBackgroundLight,
    labelType: NavigationRailLabelType.none,
    groupAlignment: 0,
    indicatorColor: primaryLight,
  ),

  listTileTheme: const ListTileThemeData(
    tileColor: surfaceLight,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: primaryLight)
    ),
    iconColor: primaryLight
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(fontFamily: fontMain, color: textLight),
    displayMedium: TextStyle(fontFamily: fontMain, color: textLight),
    displaySmall: TextStyle(fontFamily: fontMain, color: textLight),

    titleLarge: TextStyle(fontFamily: fontMain, color: textLight),
    titleMedium: TextStyle(fontFamily: fontMain, color: textLight),
    titleSmall: TextStyle(fontFamily: fontMain, color: textLight),

    bodyLarge: TextStyle(fontFamily: fontMain, color: subTextLight),
    bodyMedium: TextStyle(fontFamily: fontMain, color: subTextLight),
    bodySmall: TextStyle(fontFamily: fontMain, color: subTextLight)
  ),

  iconTheme: const IconThemeData(
    color: textLight
  )
);

//--------------------------------------------------------------------

class MarkColor extends ThemeExtension<MarkColor> {
  const MarkColor(
      {required this.text,
      required this.average,
      required this.bad,
      required this.good});

  final Color good, bad, average, text;

  @override
  MarkColor copyWith(
          {Color? good, bad, average, text}) =>
      MarkColor(
          good: good ?? this.good,
          bad: bad ?? this.bad,
          average: average ?? this.average,
          text: text ?? this.text);

  @override
  MarkColor lerp(ThemeExtension<MarkColor>? other, double t) {
    if (other is! MarkColor) {
      return this;
    }

    return MarkColor(
        good: Color.lerp(good, other.good, t) ?? Colors.white,
        bad: Color.lerp(bad, other.bad, t) ?? Colors.white,
        average:
            Color.lerp(average, other.bad, t) ?? Colors.white,
        text:
            Color.lerp(text, other.text, t) ?? Colors.white);
  }
}
