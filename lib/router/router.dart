import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import 'package:organaiser/ui/start.dart';
import 'package:organaiser/ui/screen_login/login.dart';
import 'package:organaiser/ui/screen_home/home.dart';
import 'package:organaiser/ui/page_main_menu/main_menu.dart';
import 'package:organaiser/ui/page_shedule/shedule.dart';
import 'package:organaiser/ui/page_profile/profile.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: StartScreenRoute.page, initial: true),
        AutoRoute(page: LoginScreenRoute.page, path: "/login"),
        AutoRoute(page: HomeScreenRoute.page, children: [
          AutoRoute(page: MainMenuPageRoute.page),
          AutoRoute(page: ShedulePageRoute.page),
          AutoRoute(page: ProfilePageRoute.page)
        ])
      ];
}
