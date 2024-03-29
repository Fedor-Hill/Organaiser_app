import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
//For Theme
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:organaiser/theme/current_theme.dart';
//For Route
import 'package:organaiser/router/router.dart';
//Repository for GetIt
import 'package:organaiser/data/api_kundelik/kun_api.dart';
import 'package:organaiser/domain/repository/kundelik/data_repository.dart';
import 'package:organaiser/domain/repository/kundelik/user_repository.dart';

//Locale
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  GetIt.I.registerSingleton<RecentMarkRepository>(KunApiWidgetData());
  GetIt.I.registerSingleton<SheduleRepository>(KunApiWidgetData());
  GetIt.I.registerSingleton<UserRepository>(ApiUserSevice());
  GetIt.I.registerSingleton<PersonsRepository>(KunApiWidgetData());
  GetIt.I.registerSingleton<CriteriaJournalMarksRepository>(KunApiWidgetData());

  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(MyApp(preferences: preferences));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.preferences});
  final SharedPreferences preferences;

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: defaultLight,
        dark: defaultDark,
        initial: AdaptiveThemeMode.dark,
        builder: (theme, darkTheme) => MaterialApp.router(
            title: 'Organaiser',
            theme: theme,
            darkTheme: darkTheme,
            routerConfig: _appRouter.config(),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: const [Locale("ru"), Locale("en")],
            locale: Locale.fromSubtags(
                languageCode: widget.preferences.getString("locale") ?? "ru")));
  }
}
