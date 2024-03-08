import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'setting_mobile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingMobileScreen();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (context, constraints) {
  //       if (constraints.maxWidth <= 600) {
  //         return const SettingMobileScreen();
  //       } else {
  //         return const SettingPcScreen();
  //       }
  //     },
  //   );
  // }
}
