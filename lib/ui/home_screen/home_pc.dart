part of 'home.dart';

class HomePcScreen extends StatelessWidget {
  const HomePcScreen(
      {super.key,
      required this.autoTabsRouter,
      required this.child,
      required this.railDestionations});

  final List<NavigationRailDestination> railDestionations;
  final TabsRouter autoTabsRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Row(
        children: [
          NavigationRailTheme(
            data: theme.navigationRailTheme,
            child: NavigationRail(
              selectedIndex: autoTabsRouter.activeIndex,
              onDestinationSelected: (index) => autoTabsRouter.setActiveIndex(index),
              destinations: railDestionations
            )
          ),
          Expanded(child: child)
        ]
      )
    );
  }
}
