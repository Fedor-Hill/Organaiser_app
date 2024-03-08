import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServerUnavaibleScreen extends StatelessWidget {
  const ServerUnavaibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.engineering_rounded,
                  size: 128, color: theme.colorScheme.error),
              Text(appLocal.server_problem,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displaySmall),
              const SizedBox(height: 5),
              Text(appLocal.prompt_return_later,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge)
            ]),
      ),
    );
  }
}
