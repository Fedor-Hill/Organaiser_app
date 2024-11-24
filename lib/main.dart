import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
//For Theme
import 'package:adaptive_theme/adaptive_theme.dart';
//For Route
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:organaiser/data/api_kundelik/api_kun.dart';
import 'package:organaiser/domain/repository/user.dart';
import 'package:organaiser/domain/repository/widget_data.dart';
import 'package:organaiser/router/router.dart';
import 'package:organaiser/theme/my_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  
  debugPrint("void main: start");

  GetIt.I.registerSingleton<UserRepository>(ApiUserMethods());
  GetIt.I.registerSingleton<WidgetDataRepository>(ApiWidgetDataMethods());

  debugPrint("void main: end");

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPrefences = await SharedPreferences.getInstance();

  runApp(MyApp(sharedPrefences: sharedPrefences));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.sharedPrefences});

  final SharedPreferences sharedPrefences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.dark,
      light: MyTheme.defaultLightTheme(),
      dark: MyTheme.defaultDarkTheme(),
      debugShowFloatingThemeButton: true,
      builder: (light, dark) {
        return MaterialApp.router(
          theme: light,
          darkTheme: dark,
          title: "Organaiser",
          routerConfig: _appRouter.config(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [Locale("ru"), Locale("en")],
          locale: Locale.
            fromSubtags(languageCode: widget.sharedPrefences.getString("locale") ?? "ru"),
        );
      },
    );
  }
}
