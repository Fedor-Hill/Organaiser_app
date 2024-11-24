part of 'stats.dart';

class StatsMobileScreen extends StatefulWidget {
  const StatsMobileScreen({super.key, required this.bloc});

  final StatsBloc bloc;

  @override
  State<StatsMobileScreen> createState() => _StatsMobileScreenState();
}

class _StatsMobileScreenState extends State<StatsMobileScreen> {
  final List<MenuItemButton> menuChildren = [];
  late int initialIndex;

  @override
  void initState() {
    super.initState();
    getMenuItem();
    final UserModel user = GetIt.I<AuthorizedUser>().user;

    initialIndex = user.numberPeriod ?? 0;
  }

  void getMenuItem() {
    List<EduGroup> eduGroups = GetIt.I<EduGroupData>().userEduGroups;

    for (EduGroup group in eduGroups) {
      menuChildren.add(MenuItemButton(
        onPressed: () {
          widget.bloc.add(ChangeDataEvent(eduGroupId: group.id));
        },
        child: Text(group.name),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context); 
    final appLocal = AppLocalizations.of(context)!;

    return Scaffold(
      body: DefaultTabController(
        initialIndex: initialIndex,
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) => [SliverAppBar(
            title: Text(appLocal.my_statistics, style: theme.textTheme.titleMedium),
            backgroundColor: theme.colorScheme.onBackground,
            centerTitle: true,
            pinned: true,
            floating: true,
            actions: [
              MenuAnchor(
                menuChildren: menuChildren,
                builder: (context, controller, child) {
                  return IconButton(
                    icon: const Icon(Icons.menu_rounded),
                    onPressed: () => controller.isOpen ? controller.close() : controller.open(),
                  );
                }
              )
            ],
            bottom: const TabBar(
              isScrollable: true,
              physics: BouncingScrollPhysics(),
              tabs: [
                Tab(icon: null, text: "1 четверть"),
                Tab(icon: null, text: "2 четверть"),
                Tab(icon: null, text: "3 четверть"),
                Tab(icon: null, text: "4 четверть"),
                Tab(icon: null, text: "Годовая")
              ],
            ),
          )],
          body: const TabBarView(
            children: [
              QuarterTab(rawNumber: 0),
              QuarterTab(rawNumber: 1),
              QuarterTab(rawNumber: 2),
              QuarterTab(rawNumber: 3),
              FinalTab()
            ]
          )
        )
      )
    );
  }
}
