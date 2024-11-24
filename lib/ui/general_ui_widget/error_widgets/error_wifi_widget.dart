import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyErrorWifiWidget extends StatelessWidget {
  const MyErrorWifiWidget({super.key, required this.onTap, this.appBar});

  final AppBar? appBar;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Material( 
          color: theme.colorScheme.surface,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))
          ),
          child: InkWell(
            onTap: () => onTap(),
            child: SizedBox(
              height: 100,
              width: 230,
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(4)),
                        color: theme.colorScheme.onBackground
                      ),
                      child: Center(
                        child: Icon(
                          Icons.wifi_off_rounded,
                          color: theme.colorScheme.error,
                          size: 42
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 7,
                    child: Text(
                      AppLocalizations.of(context)!.message_retry,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(width: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
