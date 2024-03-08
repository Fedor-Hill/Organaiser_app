part of "home.dart";

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen({
    super.key,
    required this.autoTabsRouter,
    required this.child,
    required this.userContextModel,
  });

  final TabsRouter autoTabsRouter;
  final Widget child;
  final UserContextModel userContextModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.background,
        bottomNavigationBar: NavigationBarTheme(
          data: theme.navigationBarTheme,
          child: NavigationBar(
            selectedIndex: autoTabsRouter.activeIndex,
            onDestinationSelected: (index) =>
                autoTabsRouter.setActiveIndex(index),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.menu), label: ""),
              NavigationDestination(icon: Icon(Icons.menu_book_rounded), label: ""),
              NavigationDestination(
                  icon: Icon(Icons.account_circle), label: ""),
            ],
          ),
        ),
        body: SafeArea(child: child));
  }
}
