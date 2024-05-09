import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/repository/user.dart';

class LoginOutDialog extends StatelessWidget {
  const LoginOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final router = AutoRouter.of(context);
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(appLocal.logOut_message, style: theme.textTheme.titleMedium),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(appLocal.message_no, style: theme.textTheme.titleMedium),
        ),
        TextButton(
            onPressed: () async {
              await GetIt.I<UserRepository>().delUser();
              router.replaceNamed("/login");
            },
            child:
                Text(appLocal.message_yes, style: theme.textTheme.titleMedium))
      ],
    );
  }
}
