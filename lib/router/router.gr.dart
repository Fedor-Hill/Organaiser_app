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
<<<<<<< HEAD
      final args = routeData.argsAs<HomeScreenRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomeScreen(
          key: args.key,
          userContextModel: args.userContextModel,
        ),
=======
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
>>>>>>> 18c7d66 (version 3.0.1)
      );
    },
    LoginScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
<<<<<<< HEAD
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
=======
    MainMenuScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainMenuScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    SheduleScreenRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SheduleScreen(),
>>>>>>> 18c7d66 (version 3.0.1)
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
<<<<<<< HEAD
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
=======
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute({List<PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
>>>>>>> 18c7d66 (version 3.0.1)
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

<<<<<<< HEAD
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
=======
  static const PageInfo<void> page = PageInfo<void>(name);
>>>>>>> 18c7d66 (version 3.0.1)
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
<<<<<<< HEAD
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
=======
/// [MainMenuScreen]
class MainMenuScreenRoute extends PageRouteInfo<void> {
  const MainMenuScreenRoute({List<PageRouteInfo>? children})
      : super(
          MainMenuScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainMenuScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileScreenRoute extends PageRouteInfo<void> {
  const ProfileScreenRoute({List<PageRouteInfo>? children})
      : super(
          ProfileScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SheduleScreen]
class SheduleScreenRoute extends PageRouteInfo<void> {
  const SheduleScreenRoute({List<PageRouteInfo>? children})
      : super(
          SheduleScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SheduleScreenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
>>>>>>> 18c7d66 (version 3.0.1)
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
