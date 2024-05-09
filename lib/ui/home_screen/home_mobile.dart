part of 'home.dart';

class HomeMobileScreen extends StatelessWidget {
  const HomeMobileScreen(
      {super.key,
      required this.autoTabsRouter,
      required this.child,
      required this.destionations});

  final List<NavigationDestination> destionations;
  final TabsRouter autoTabsRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(child: child),
      bottomNavigationBar: NavigationBar(
        selectedIndex: autoTabsRouter.activeIndex,
        onDestinationSelected: (index) =>
            autoTabsRouter.setActiveIndex(index),
        destinations: destionations
      )
    );
  }
}
