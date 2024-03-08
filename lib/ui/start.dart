import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organaiser/router/router.dart';
import 'package:organaiser/ui/screen_error/server_unavailable/ser_unavaible.dart';
import 'package:organaiser/ui/screen_error/var_error/var_error.dart';
import 'package:organaiser/ui/screen_splash/screen_splash.dart';
import 'package:organaiser/ui/start_bloc.dart';

@RoutePage()
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen> {
  final CheckingBloc _checkingBloc = CheckingBloc();

  @override
  void initState() {
    debugPrint("Start App");
    _checkingBloc.add(OnAppStartEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return BlocListener(
      bloc: _checkingBloc,
      listener: (context, state) {
        if (state is SuccesState) {
          debugPrint("From Succes State: replace to Home screen");
          router.replace(
              HomeScreenRoute(userContextModel: state.userContextModel));
          _checkingBloc.close();
        }
        if (state is FailureState) {
          debugPrint("From Failure State: replace to Login screen");
          router.replace(const LoginScreenRoute());
          _checkingBloc.close();
        }
        if (state is ServerUnavailableState) {
          debugPrint("From ServerUnavailableState");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ServerUnavaibleScreen()));
        }
        if (state is ServerProblemState) {
          debugPrint("From ServerProblemState");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      VarErrorScreen(appBar: null, funcRetry: retry)));
          // router.replace(FailScreen(func: retry()))
        }
      },
      child: const SplashScreen(),
    );
  }

  void retry() {
    _checkingBloc.add(OnAppStartEvent());
  }
}
