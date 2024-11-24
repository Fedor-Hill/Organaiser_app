part of 'main_menu_screen.dart';

class MainMenuMobileScreen extends StatelessWidget {
  const MainMenuMobileScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    final UserModel user = GetIt.I<AuthorizedUser>().user;
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
                    style: theme.textTheme.titleLarge
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "${user.lastName} ${user.firstName}",
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleLarge
                  ),
                ),
              ],
            ),
          ),
        ),
        //-------------
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: MyLineInfo(title: appLocal.week_static, color: theme.colorScheme.secondary),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          sliver: SliverToBoxAdapter(
            child: CardStats(),
          ),
        ),
        //-------------
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverToBoxAdapter(
            child: MyLineInfo(title: appLocal.titileRecentMark)
          ),
        ),
        //-------------
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          sliver: ListRecentMarks()
        )
      ],
    );
  }
}
