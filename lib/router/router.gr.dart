// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(
          key: args.key,
          userContextModel: args.userContextModel,
        ),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    MainMenuPageRoute.name: (routeData) {
      final args = routeData.argsAs<MainMenuPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MainMenuPage(
          key: args.key,
          userContextModel: args.userContextModel,
        ),
      );
    },
    ProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilePageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfilePage(
          key: args.key,
          userContextModel: args.userContextModel,
        ),
      );
    },
    ShedulePageRoute.name: (routeData) {
      final args = routeData.argsAs<ShedulePageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ShedulePage(
          key: args.key,
          userContextModel: args.userContextModel,
        ),
      );
    },
    StartScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StartScreen(),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    Key? key,
    required UserContextModel userContextModel,
    List<PageRouteInfo>? children,
  }) : super(
          HomeScreenRoute.name,
          args: HomeScreenRouteArgs(
            key: key,
            userContextModel: userContextModel,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const PageInfo<HomeScreenRouteArgs> page =
      PageInfo<HomeScreenRouteArgs>(name);
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({
    this.key,
    required this.userContextModel,
  });

  final Key? key;

  final UserContextModel userContextModel;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key, userContextModel: $userContextModel}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginScreenRoute extends PageRouteInfo<void> {
  const LoginScreenRoute({List<PageRouteInfo>? children})
      : super(
          LoginScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainMenuPage]
class MainMenuPageRoute extends PageRouteInfo<MainMenuPageRouteArgs> {
  MainMenuPageRoute({
    Key? key,
    required UserContextModel userContextModel,
    List<PageRouteInfo>? children,
  }) : super(
          MainMenuPageRoute.name,
          args: MainMenuPageRouteArgs(
            key: key,
            userContextModel: userContextModel,
          ),
          initialChildren: children,
        );

  static const String name = 'MainMenuPageRoute';

  static const PageInfo<MainMenuPageRouteArgs> page =
      PageInfo<MainMenuPageRouteArgs>(name);
}

class MainMenuPageRouteArgs {
  const MainMenuPageRouteArgs({
    this.key,
    required this.userContextModel,
  });

  final Key? key;

  final UserContextModel userContextModel;

  @override
  String toString() {
    return 'MainMenuPageRouteArgs{key: $key, userContextModel: $userContextModel}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<ProfilePageRouteArgs> {
  ProfilePageRoute({
    Key? key,
    required UserContextModel userContextModel,
    List<PageRouteInfo>? children,
  }) : super(
          ProfilePageRoute.name,
          args: ProfilePageRouteArgs(
            key: key,
            userContextModel: userContextModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfilePageRoute';

  static const PageInfo<ProfilePageRouteArgs> page =
      PageInfo<ProfilePageRouteArgs>(name);
}

class ProfilePageRouteArgs {
  const ProfilePageRouteArgs({
    this.key,
    required this.userContextModel,
  });

  final Key? key;

  final UserContextModel userContextModel;

  @override
  String toString() {
    return 'ProfilePageRouteArgs{key: $key, userContextModel: $userContextModel}';
  }
}

/// generated route for
/// [ShedulePage]
class ShedulePageRoute extends PageRouteInfo<ShedulePageRouteArgs> {
  ShedulePageRoute({
    Key? key,
    required UserContextModel userContextModel,
    List<PageRouteInfo>? children,
  }) : super(
          ShedulePageRoute.name,
          args: ShedulePageRouteArgs(
            key: key,
            userContextModel: userContextModel,
          ),
          initialChildren: children,
        );

  static const String name = 'ShedulePageRoute';

  static const PageInfo<ShedulePageRouteArgs> page =
      PageInfo<ShedulePageRouteArgs>(name);
}

class ShedulePageRouteArgs {
  const ShedulePageRouteArgs({
    this.key,
    required this.userContextModel,
  });

  final Key? key;

  final UserContextModel userContextModel;

  @override
  String toString() {
    return 'ShedulePageRouteArgs{key: $key, userContextModel: $userContextModel}';
  }
}

/// generated route for
/// [StartScreen]
class StartScreenRoute extends PageRouteInfo<void> {
  const StartScreenRoute({List<PageRouteInfo>? children})
      : super(
          StartScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
