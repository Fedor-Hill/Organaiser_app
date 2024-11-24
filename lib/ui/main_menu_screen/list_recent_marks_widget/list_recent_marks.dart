import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:organaiser/domain/model/mark/mark.dart';
import 'package:organaiser/theme/default_theme.dart';

class ListRecentMarks extends StatelessWidget {
  const ListRecentMarks({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final List<Mark> recentMarks = GetIt.I<RecentMarkData>().recentMarks;

    if (recentMarks.isEmpty) {
      return SliverToBoxAdapter(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Icon(
              Icons.hourglass_empty_rounded,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            Text(
              appLocal.no_marks,
              style: Theme.of(context).textTheme.titleLarge
            ),
          ],
        ),
      );
    }
    return SliverList.builder(
      itemCount: recentMarks.length,
      itemBuilder: (context, int index) {
        if (index == 0 || recentMarks[index].markDate.day != recentMarks[index - 1].markDate.day) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    DateFormat.MMMMd(AppLocalizations.of(context)!.locale)
                        .format(recentMarks[index].markDate)
                        .toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.left,
                  )               
                ),
              ),
              MarkTile(mark: recentMarks[index]),
              const SizedBox(height: 5)
            ],
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: MarkTile(mark: recentMarks[index]),
          );
        }
      }
    );
  }
}

class MarkTile extends StatelessWidget {
  const MarkTile({super.key, required this.mark});

  final Mark mark;

  void onTap(BuildContext context, ThemeData theme, AppLocalizations appLocal) {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        backgroundColor: theme.colorScheme.onBackground,
        builder: (context) => MarkDetailModalBottomSheet(mark: mark)
    );
  }

  Color getMarkColor(MarkColor markColor, String mood) {
    switch (mood) {
      case "Good":
        return markColor.good;
      case "Average":
        return markColor.average;
      default:
        return markColor.bad;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final appLocal = AppLocalizations.of(context)!;
    final MarkColor markColor = theme.extension<MarkColor>()!;
    String value = "";
    String subTitle = "";

    if (mark is RecentMark) {
      RecentMark reMark = mark as RecentMark;
      value = mark.value.toString();
      final String dateLesson = DateFormat.MMMMd(appLocal.locale)
        .format(reMark.lessonDate)
        .toString();
      subTitle = "ФО за $dateLesson\n${reMark.title}";
    }

    if (mark is CriteriaMark) {
      CriteriaMark crMark = mark as CriteriaMark; 
      value = "${crMark.value}|${crMark.maxValue}";
      int part = crMark.part; 

      if (part == 0) {
        subTitle = "СОЧ";
      } else {
        subTitle = "СОР №$part";
      }
    }

    return Material(
      color: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: InkWell(
        onTap: () => onTap(context, theme, appLocal),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              Flexible(
                  flex: 3,
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: getMarkColor(markColor, mark.mood)
                    ),
                    child: Center(
                      child: Text(value,
                          style: theme.textTheme.displaySmall!.
                            copyWith(color: theme.colorScheme.onBackground)
                       ),
                   ),
                )
              ),
              Flexible(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          mark.subject,
                          style: theme.textTheme.titleLarge,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                            subTitle,
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            softWrap: false,
                            overflow: TextOverflow.fade
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MarkDetailModalBottomSheet extends StatelessWidget {
  const MarkDetailModalBottomSheet({super.key, required this.mark});

  final Mark mark; 

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);  
    final appLocal = AppLocalizations.of(context)!;

    const Divider myDivider = 
      Divider(indent: 10, endIndent: 10);

    String body = ""; 

    final String markDate = 
        DateFormat.yMd(appLocal.locale).add_jmz().format(mark.markDate);

    if (mark is RecentMark) {
      RecentMark reMark = mark as RecentMark; 
      
      final String lessonDate = 
        DateFormat.yMd(appLocal.locale).format(reMark.lessonDate);
      body = "${appLocal.lesson_theme(reMark.title)}\n${appLocal.mark_value(reMark.value)}\n${appLocal.date_lesson(lessonDate)}\n${appLocal.date_mark(markDate)}";
    }

    if (mark is CriteriaMark) {
      CriteriaMark crMark = mark as CriteriaMark; 

      body = "${appLocal.mark_value(crMark.value)}|${crMark.maxValue}\n${appLocal.date_mark(markDate)}";
    }

    return DraggableScrollableSheet(
      initialChildSize: 1,
      builder: (context, scrollController) => 
        ListView(
          controller: scrollController,
          children: [
            Text(
              mark.subject,
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary
              ),
              textAlign: TextAlign.center,
            ),
            myDivider,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                body, 
                style: theme.textTheme.bodyLarge
              ),
            )
          ],
              )
    );
  }
}
