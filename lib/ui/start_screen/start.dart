import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organaiser/router/router.dart';
import 'package:organaiser/ui/general_ui_widget/error_widgets/error_wifi_widget.dart';
import 'package:organaiser/ui/general_ui_widget/splash_widget/splash.dart';
import 'package:organaiser/ui/start_screen/bloc/start_bloc.dart';

@RoutePage()
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreen();
}

class _StartScreen extends State<StartScreen> {
  final StartBloc _bloc = StartBloc();

  @override
  void initState() {
    super.initState();
    debugPrint("Start App");
    _bloc.add(AppStartEvent());
  }

  void retry() => _bloc.add(AppStartEvent());

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    return BlocListener(
      bloc: _bloc,
      listener: (context, state) {
        if (state is SuccesState) {
          debugPrint("From Succes State: replace to Home screen");
          router.replace(const HomeScreenRoute());
          _bloc.close();
        }

        if (state is FailureState) {
          debugPrint("From Failure State: replace to Login screen");
          router.replace(const LoginScreenRoute());
          _bloc.close();
        }

        if (state is ConnectionProblemState) {
          debugPrint("From ConnectionProblemState");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyErrorWifiWidget(onTap: retry)
            )
          );
        }
      },
      child: const Scaffold(
        body: Center(child: SplashScreen()),
      ),
    );
  }
}
