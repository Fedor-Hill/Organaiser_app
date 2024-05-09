import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:organaiser/domain/model/mark/mark.dart';
import 'package:organaiser/theme/default_theme.dart';
import 'package:organaiser/ui/stats_screen/stats.dart';

class CardStats extends StatelessWidget {
  const CardStats({super.key});

  @override
  Widget build(BuildContext context) {
    RecentMarkStats stats = GetIt.I<RecentMarkData>().getStats();
    final appLocal = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    final MarkColor markColor = theme.extension<MarkColor>()!;
    if (stats.count == 0) {
      return SizedBox(
        width: double.infinity,
        child: Text(
          appLocal.no_marks,
          style: theme.textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StatsScreen())
        ),
        tileColor: theme.colorScheme.onBackground,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: BorderSide(color: theme.colorScheme.secondary)
        ),
        leading: stats.mood == 0 
          ? Icon(Icons.mood_rounded, color: theme.colorScheme.secondary, size: 48)
          : stats.mood == 1 
            ? Icon(Icons.sentiment_neutral_rounded, color: markColor.good, size: 48)
            : Icon(Icons.sentiment_dissatisfied_rounded, color: markColor.bad, size: 48),
        title: stats.mood == 0
          ? Text(appLocal.mood_nice)
          : stats.mood == 1 
            ? Text(appLocal.mood_good)
            : Text(appLocal.mood_bad),
        titleTextStyle: theme.textTheme.titleLarge,
        subtitle: Text(
          appLocal.week_info(stats.midValue.toStringAsFixed(2), stats.count)
        ),
        subtitleTextStyle: theme.textTheme.bodyMedium,
        trailing: Icon(Icons.chevron_right, color: theme.colorScheme.secondary),
      ),
    );
  }
}
