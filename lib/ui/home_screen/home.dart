import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:organaiser/router/router.dart';

part 'home_mobile.dart';
part 'home_pc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<NavigationDestination> destionations = [
      NavigationDestination(icon: Icon(Icons.menu_rounded), label: ""),
      NavigationDestination(icon: Icon(Icons.menu_book_rounded), label: ""),
      NavigationDestination(icon: Icon(Icons.account_circle_rounded), label: "")
    ];

    const List<NavigationRailDestination> railDestionations = [
      NavigationRailDestination(icon: Icon(Icons.menu_rounded), label: Text("")),
      NavigationRailDestination(icon: Icon(Icons.menu_book_rounded), label: Text("")),
      NavigationRailDestination(icon: Icon(Icons.account_circle_rounded), label: Text(""))
    ];

    return AutoTabsRouter(
      routes: const [
        MainMenuScreenRoute(),
        SheduleScreenRoute(),
        ProfileScreenRoute()
      ],
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),

      builder: (context, child) {
        final TabsRouter autoTabsRouter = AutoTabsRouter.of(context);

        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return HomeMobileScreen(autoTabsRouter: autoTabsRouter, destionations: destionations, child: child);
            } else {
              return HomePcScreen(autoTabsRouter: autoTabsRouter, railDestionations: railDestionations, child: child);
            }
          }
        );
      }
    );
  }
}
