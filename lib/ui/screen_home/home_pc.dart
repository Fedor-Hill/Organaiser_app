part of 'home.dart';

class HomePcScreen extends StatelessWidget {
  const HomePcScreen(
      {super.key, required this.autoTabsRouter, required this.child});

  final TabsRouter autoTabsRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Row(
        children: [
          NavigationRailTheme(
            data: theme.navigationRailTheme,
            child: NavigationRail(
                selectedIndex: autoTabsRouter.activeIndex,
                onDestinationSelected: (int index) {
                  autoTabsRouter.setActiveIndex(index);
                },
                destinations: const [
                  NavigationRailDestination(
                      icon: Icon(Icons.menu), label: Text("")),
                  NavigationRailDestination(
                          icon: Icon(Icons.menu_book_rounded),
                          label: Text("")
                  ),
                  NavigationRailDestination(
                      icon: Icon(Icons.account_circle), label: Text(""))
              ]
            ),
          ),
          // const VerticalDivider(),
          Expanded(child: child)
        ],
      ),
    );
  }
}
