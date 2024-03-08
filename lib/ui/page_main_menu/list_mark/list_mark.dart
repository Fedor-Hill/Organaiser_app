import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'package:organaiser/domain/model/recent_mark_model/recent_mark_model.dart';
import 'package:organaiser/theme/default/extension/mark_color.dart';

class ListMark extends StatelessWidget {
  const ListMark({super.key, required this.list});

  final List<RecentMarkModel> list;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => MarkPanel(recentMarkModel: list[index]),
    );
  }
}

class MarkPanel extends StatelessWidget {
  const MarkPanel({super.key, required this.recentMarkModel});
  final RecentMarkModel recentMarkModel;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final String dateMark = DateFormat.MMMMd(appLocal.locale)
        .format(recentMarkModel.markDate)
        .toString();
    final String dateLesson = DateFormat.MMMMd(appLocal.locale)
        .format(recentMarkModel.lessonDate)
        .toString();

    final theme = Theme.of(context);
    final MarkColor markColor = theme.extension<MarkColor>()!;

    Color getMarkColor(String mood) {
      if (mood == "Good") {
        return markColor.goodMark;
      } else if (mood == "Average") {
        return markColor.satisfactorilyMark;
      } else {
        return markColor.badMark;
      }
    }

    if (recentMarkModel.isNewTitle == true) {
      return Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  dateMark,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.titleMedium,
                ),
              )),
          SizedBox(
            height: 100,
            child: Card(
                color: theme.cardTheme.color,
                shape: theme.cardTheme.shape,
                elevation: theme.cardTheme.elevation,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            color: getMarkColor(recentMarkModel.mood)),
                        child: Center(
                          child: Text(recentMarkModel.value,
                              style: theme.textTheme.displaySmall!.copyWith(
                                  color: theme.colorScheme.background)),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 8,
                      child: SizedBox(
                          height: 100,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(5),
                            onTap: () =>
                                showMarkInfo(context, theme, recentMarkModel),
                            title: Text(
                              recentMarkModel.subject,
                              maxLines: 1,
                              style: theme.textTheme.titleLarge,
                            ),
                            subtitle: Text(
                                "ФО за $dateLesson \n${recentMarkModel.lesson}",
                                maxLines: 3,
                                style: theme.textTheme.bodyMedium,
                                softWrap: false,
                                overflow: TextOverflow.fade),
                          )),
                    )
                  ],
                )),
          )
        ],
      );
    } else {
      return SizedBox(
        height: 100,
        child: Card(
            color: theme.cardTheme.color,
            shape: theme.cardTheme.shape,
            elevation: theme.cardTheme.elevation,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: getMarkColor(recentMarkModel.mood)),
                    child: Center(
                      child: Text(recentMarkModel.value,
                          style: theme.textTheme.displaySmall!
                              .copyWith(color: theme.colorScheme.background)),
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: SizedBox(
                      height: 100,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(5),
                        onTap: () =>
                            showMarkInfo(context, theme, recentMarkModel),
                        title: Text(
                          recentMarkModel.subject,
                          maxLines: 1,
                          style: theme.textTheme.titleLarge,
                        ),
                        subtitle: Text(
                            "ФО за $dateLesson\n${recentMarkModel.lesson}",
                            maxLines: 3,
                            style: theme.textTheme.bodyMedium,
                            softWrap: false,
                            overflow: TextOverflow.fade),
                      )),
                )
              ],
            )),
      );
    }
  }

  void showMarkInfo(
      BuildContext context, ThemeData theme, RecentMarkModel recentMarkModel) {
    final appLocal = AppLocalizations.of(context)!;
    final String markDate = DateFormat.yMd(appLocal.locale)
        .add_jmz()
        .format(recentMarkModel.markDate);
    final String lessonDate =
        DateFormat.yMd(appLocal.locale).format(recentMarkModel.lessonDate);

    showModalBottomSheet(
        showDragHandle: true,
        context: context,
        builder: (context) => DraggableScrollableSheet(
              initialChildSize: 1,
              builder: (context, scrollController) => ListView(
                controller: scrollController,
                children: [
                  Text(recentMarkModel.subject,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: theme.colorScheme.primary)),
                  Divider(
                      color: theme.colorScheme.primary,
                      indent: 10,
                      endIndent: 10,
                      height: 20),
                  ListTile(
                      title: Text(recentMarkModel.lesson,
                          style: theme.textTheme.titleMedium)),
                  Divider(
                      color: theme.colorScheme.primary,
                      indent: 10,
                      endIndent: 10,
                      height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Text(
                              appLocal.mark_value(recentMarkModel.value),
                              style: theme.textTheme.titleMedium,
                            )),
                        SizedBox(
                            width: double.infinity,
                            child: Text(appLocal.date_mark(markDate),
                                style: theme.textTheme.titleMedium)),
                        SizedBox(
                            width: double.infinity,
                            child: Text(appLocal.date_lesson(lessonDate),
                                style: theme.textTheme.titleMedium)),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
