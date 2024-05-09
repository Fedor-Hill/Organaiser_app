part of 'shedule_screen.dart';

class SheduleMobilePage extends StatelessWidget {
  const SheduleMobilePage(
      {super.key, required this.sheduleBloc, required this.shedule});
  final SheduleBloc sheduleBloc;
  final Shedule shedule;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final String date = DateFormat.MMMMEEEEd(appLocal.localeName)
        .format(shedule.dayModel[0].date)
        .toString();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: SheduleList(shedule: shedule, func: onClick,)),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
            child: ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13))),
                title: Text(date,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge),
                tileColor: theme.colorScheme.surface,
                leading: IconButton(
                  onPressed: () => onClick(context, 0),
                  icon: Icon(Icons.chevron_left_rounded,
                      color: theme.colorScheme.primary),
                ),
                trailing: IconButton(
                  onPressed: () => onClick(context, 1),
                  icon: Icon(Icons.chevron_right_rounded,
                      color: theme.colorScheme.primary),
                )))
      ],
    );
  }

  void onClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        sheduleBloc.add(OnDateDecrement());
        break;
      case 1:
        sheduleBloc.add(OnDateIncrement());
        break;
      case 2:
        sheduleBloc.add(OnDateToday());
        break;
    }
  }
}

class SheduleList extends StatelessWidget {
  const SheduleList({super.key, required this.shedule, required this.func});

  final Shedule shedule;
  final Function func;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (shedule.dayModel[0].lessons.isEmpty) {
      return Center(
          child: Text(appLocal.lesson_zero, style: theme.textTheme.titleLarge));
    } else {
      return CustomScrollView(slivers: [
        SliverAppBar(
            title: Text(
                appLocal.lesson_count(shedule.dayModel.last.lessons.last.number),
                style: theme.textTheme.titleLarge),
            backgroundColor: theme.colorScheme.surface,
            leading: DateTime.now().day != shedule.dayModel[0].date.day ? IconButton(
                onPressed: () => func(context, 2),
                icon: Icon(
                  Icons.today_rounded,
                  color: theme.colorScheme.secondary,
                )) : null,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(13))),
            bottom: null),
        SliverList.builder(
          itemCount: shedule.dayModel[0].lessons.length,
          itemBuilder: (context, index) => SheduleTile(
              index: index,
              lessonSheduleModel: shedule.dayModel[0].lessons[index]),
        )
      ]);
    }
  }
}

class SheduleTile extends StatelessWidget {
  const SheduleTile(
      {super.key, required this.index, required this.lessonSheduleModel});
  final LessonSheduleModel lessonSheduleModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    String? haveHomeWork = lessonSheduleModel.homework;

    return ListTileTheme(
      data: null,
      child: ListTile(
        tileColor: Colors.transparent,
        title: Row(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
              flex: 6,
              child: Text(
                "${lessonSheduleModel.number.toString()}: ${lessonSheduleModel.subject}",
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleLarge,
              )),
          Expanded(
              flex: 4,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      lessonSheduleModel.hours,
                      style: theme.textTheme.titleMedium,
                    ),
                    Icon(Icons.navigate_next, color: theme.colorScheme.primary)
                  ]))
        ]),
        subtitle: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Text(lessonSheduleModel.title,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium)),
            SizedBox(
                width: double.infinity,
                child: Text(
                    haveHomeWork == null
                        ? appLocal.homework_null
                        : appLocal.homework_short(haveHomeWork),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium)),
            SizedBox(
              width: double.infinity,
              child: Divider(
                color: theme.colorScheme.primary,
              ),
            )
          ],
        ),
        onTap: () => showModalBottomSheet(
            showDragHandle: true,
            context: context,
            builder: (BuildContext context) {
              return DraggableScrollableSheet(
                  initialChildSize: 1,
                  expand: false,
                  builder: (context, scrollController) => ListView(
                        controller: scrollController,
                        children: [
                          Text(
                            lessonSheduleModel.subject,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleLarge!
                                .copyWith(color: theme.colorScheme.primary),
                          ),
                          const Divider(
                              indent: 10,
                              endIndent: 10,
                              height: 20),
                          ListTileTheme(
                            data: null,
                            child: ListTile(
                              tileColor: Colors.transparent,
                              title: Text(
                                appLocal.lesson_theme(lessonSheduleModel.title),
                                style: theme.textTheme.titleMedium,
                              ),
                              onLongPress: () => copyToClipBoard(
                                  context, lessonSheduleModel.title, theme),
                            ),
                          ),
                          const Divider(
                              indent: 10,
                              endIndent: 10,
                              height: 20),
                          ListTileTheme(
                            data: null,
                            child: ListTile(
                              tileColor: Colors.transparent,
                              title: Text(
                                appLocal.homework(lessonSheduleModel.homework ??
                                    appLocal.homework_null),
                                style: theme.textTheme.titleMedium,
                              ),
                              onLongPress: () => copyToClipBoard(
                                  context,
                                  lessonSheduleModel.homework ??
                                      appLocal.homework_null,
                                  theme),
                            ),
                          )
                        ],
                      ));
            }),
      ),
    );
  }

  void copyToClipBoard(BuildContext context, String data, ThemeData theme) {
    final SnackBar snack = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: theme.colorScheme.primary, width: 1.5)),
      showCloseIcon: true,
      closeIconColor: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.surface,
      content:
          Text(AppLocalizations.of(context)!.message_copy_succes, style: theme.textTheme.titleMedium),
    );

    Clipboard.setData(ClipboardData(text: data))
        .then((_) => ScaffoldMessenger.of(context).showSnackBar(snack));
    context.maybePop();
  }
}
