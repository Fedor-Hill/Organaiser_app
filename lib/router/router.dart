import 'package:auto_route/auto_route.dart';
import 'package:organaiser/ui/home_screen/home.dart';
import 'package:organaiser/ui/login_screen/login.dart';
import 'package:organaiser/ui/start_screen/start.dart';
import 'package:organaiser/ui/main_menu_screen/main_menu_screen.dart';
import 'package:organaiser/ui/shedule_screen/shedule_screen.dart';
import 'package:organaiser/ui/profile_screen/profile_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: StartScreenRoute.page, initial: true),
        AutoRoute(page: LoginScreenRoute.page, path: "/login"),
        AutoRoute(page: HomeScreenRoute.page, children: [
          AutoRoute(page: MainMenuScreenRoute.page),
          AutoRoute(page: SheduleScreenRoute.page),
          AutoRoute(page: ProfileScreenRoute.page)
        ])
      ];
}
