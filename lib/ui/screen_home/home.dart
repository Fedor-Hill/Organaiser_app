import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/router/router.dart';

part 'home_mobile.dart';
part 'home_pc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userContextModel});
  final UserContextModel userContextModel;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        MainMenuPageRoute(userContextModel: userContextModel),
        ShedulePageRoute(userContextModel: userContextModel),
        ProfilePageRoute(userContextModel: userContextModel)
      ],
      transitionBuilder: (context, child, animation) =>
          FadeTransition(opacity: animation, child: child),
      builder: (context, child) {
        final TabsRouter autoTabsRouter = AutoTabsRouter.of(context);

        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return HomeMobileScreen(
                autoTabsRouter: autoTabsRouter,
                userContextModel: userContextModel,
                child: child,
              );
            } else {
              return HomePcScreen(
                  autoTabsRouter: autoTabsRouter, 
                  child: child
              );
            }
          }
        );
      }
    );
  }
}
