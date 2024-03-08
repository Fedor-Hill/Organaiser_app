import 'package:flutter/material.dart';
import 'package:organaiser/theme/default/extension/mark_color.dart';
part 'const_color.dart';

ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    extensions: const <ThemeExtension<dynamic>>[
      MarkColor(
          textMarkColor: kTextColorMark,
          goodMark: kGoodMood,
          badMark: kBadMood,
          satisfactorilyMark: kAverageMood)
    ],
    colorScheme: const ColorScheme.light(
      primary: kPrimary,
      error: kError,
      background: kBackground,
      onBackground: kOnBackground,
      surface: kSurface,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorColor: kPrimary,
      labelColor: kText,
    ),
    textTheme: const TextTheme(

        displayLarge: TextStyle(fontFamily: 'Comforta', color: kText),
        displayMedium: TextStyle(fontFamily: 'Comforta', color: kText),
        displaySmall: TextStyle(fontFamily: 'Comforta', color: kText),

        headlineLarge: TextStyle(fontFamily: 'Comforta', color: kText),
        headlineMedium: TextStyle(fontFamily: 'Comforta', color: kText),
        headlineSmall: TextStyle(fontFamily: 'Comforta', color: kText),

        titleLarge: TextStyle(fontFamily: 'Comforta', color: kText),
        titleMedium: TextStyle(fontFamily: 'Comforta', color: kText),
        titleSmall: TextStyle(fontFamily: 'Comforta', color: kText),

        bodyLarge: TextStyle(fontFamily: 'Comforta', color: kSubText),
        bodyMedium: TextStyle(fontFamily: 'Comforta', color: kSubText),
        bodySmall: TextStyle(fontFamily: 'Comforta', color: kSubText),

        labelLarge: TextStyle(fontFamily: 'Comforta', color: kText),
        labelMedium: TextStyle(fontFamily: 'Comforta', color: kText),
        labelSmall: TextStyle(fontFamily: 'Comforta', color: kText)),
    navigationBarTheme: const NavigationBarThemeData(
      elevation: 9.6,
      backgroundColor: kOnBackground,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      indicatorColor: kOverlay,
      surfaceTintColor: kBackground,
      iconTheme: MaterialStatePropertyAll(IconThemeData(
        color: kPrimary,
      )),
    ),
    navigationRailTheme: const NavigationRailThemeData(
        backgroundColor: kOnBackground,
        indicatorColor: kOverlay,
        selectedIconTheme: IconThemeData(color: kPrimary),
        unselectedIconTheme: IconThemeData(color: kText),
        labelType: NavigationRailLabelType.none,
        groupAlignment: 0,
        elevation: 9.6),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(kPrimary),
            padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
            foregroundColor: const MaterialStatePropertyAll(kBackground),
            textStyle: const MaterialStatePropertyAll(TextStyle(
              fontSize: 18,
              color: kBackground,
            )),
            overlayColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return kOverlay;
              }

              return null;
            }),
            splashFactory: InkSparkle.splashFactory)),
    cardTheme: const CardTheme(
      color: kCardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(13))),
    ),
    iconTheme: const IconThemeData(color: kIconColor));
