import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          //For mobile Screen
          return Scaffold(
              backgroundColor: theme.colorScheme.background,
              body: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(appLocal.nameApp,
                          style: theme.textTheme.displayMedium),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 69),
                        child: LinearProgressIndicator(),
                      )
                    ],
                  )));
          //For PC screen
        } else {
          return Scaffold(
              backgroundColor: theme.colorScheme.background,
              body: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(appLocal.nameApp,
                          style: theme.textTheme.displayLarge),
                      const SizedBox(height: 20),
                      const CircularProgressIndicator(),
                    ],
                  )));
        }
      },
    );
  }
}
