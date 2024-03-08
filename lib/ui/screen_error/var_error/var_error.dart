import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// Fpr variety error
//
class VarErrorScreen extends StatelessWidget {
  const VarErrorScreen(
      {super.key, required this.funcRetry, required this.appBar});

  final Function funcRetry;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final double width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return Scaffold(
        appBar: appBar,
        backgroundColor: theme.colorScheme.background,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: theme.colorScheme.onBackground),
                      child: Icon(Icons.running_with_errors_rounded,
                          color: theme.colorScheme.error,
                          size: width >= 600 ? 64 : 42),
                    ),
                    const SizedBox(width: 5),
                    Text(appLocal.message_errore,
                        // textAlign: TextAlign.center,
                        style: width >= 600
                            ? theme.textTheme.displaySmall
                            : theme.textTheme.headlineSmall),
                    const SizedBox(width: 5)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButtonTheme(
                  data: theme.elevatedButtonTheme,
                  child: ElevatedButton(
                    onPressed: () => funcRetry(),
                    child: Text(appLocal.message_retry,
                        style: width >= 600
                            ? theme.textTheme.titleLarge!
                                .copyWith(color: theme.colorScheme.background)
                            : theme.textTheme.titleLarge!
                                .copyWith(color: theme.colorScheme.background)),
                  )),
            ],
          ),
        ));
  }
}
