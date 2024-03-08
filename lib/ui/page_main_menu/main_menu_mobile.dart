part of 'main_menu.dart';

class MainMenuMobilePage extends StatelessWidget {
  const MainMenuMobilePage(
      {super.key,
      required this.userContextModel,
      required this.midValue,
      required this.weekMood,
      required this.list});
  final UserContextModel userContextModel;
  final double midValue;
  // 2 - Super good, 1 - good, 0 - bad
  final int weekMood;
  final List<RecentMarkModel> list;

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
          sliver: SliverToBoxAdapter(
              child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Text(
                    getTime(context),
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleLarge,
                  )),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "${userContextModel.lastName} ${userContextModel.firstName}",
                  textAlign: TextAlign.left,
                  style: theme.textTheme.titleLarge,
                ),
              )
            ],
          )),
        ),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.square_rounded, color: theme.colorScheme.primary),
                  const SizedBox(width: 5),
                  Text(
                    appLocal.week_static,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                      child: Divider(
                    color: theme.colorScheme.primary,
                    thickness: 2,
                  ))
                ],
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          sliver: SliverToBoxAdapter(
            child: ListTile(
                leading: weekMood > 0
                    ? weekMood == 2
                        ? Icon(
                            Icons.mood_rounded,
                            color: theme.colorScheme.primary,
                            size: 48,
                          )
                        : Icon(Icons.sentiment_neutral_rounded,
                            color: theme.colorScheme.primary, size: 48)
                    : Icon(Icons.sentiment_dissatisfied_rounded,
                        color: theme.colorScheme.error, size: 48),
                title: weekMood > 0
                    ? weekMood == 2
                        ? Text(appLocal.mood_nice,
                            style: theme.textTheme.titleLarge)
                        : Text(appLocal.mood_good,
                            style: theme.textTheme.titleLarge)
                    : Text(appLocal.mood_bad,
                        style: theme.textTheme.titleLarge),
                subtitle: Text(
                    appLocal.week_info(midValue.toStringAsFixed(2), 10),
                    style: theme.textTheme.bodyMedium)),
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.square_rounded, color: theme.colorScheme.primary),
                  const SizedBox(width: 5),
                  Text(
                    appLocal.titileRecentMark,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                      child: Divider(
                    color: theme.colorScheme.primary,
                    thickness: 2,
                  ))
                ],
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: ListMark(list: list),
        ),
      ],
    );
  }

  String getTime(BuildContext context) {
    final appLocal = AppLocalizations.of(context);
    final int time = DateTime.now().hour;

    if ((time >= 0) && (time < 6)) {
      return appLocal!.goodnight;
    } else if ((time >= 6) && (time < 12)) {
      return appLocal!.greetingMorning;
    } else if ((time >= 12) && (time < 18)) {
      return appLocal!.greetingDay;
    } else {
      return appLocal!.greetingEvening;
    }
  }
}
