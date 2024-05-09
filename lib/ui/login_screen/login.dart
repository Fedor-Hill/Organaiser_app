import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organaiser/router/router.dart';
import 'package:organaiser/ui/general_ui_widget/button_widget/my_button.dart';
import 'package:organaiser/ui/login_screen/bloc/login_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:organaiser/ui/general_ui_widget/text_field_widget/my_text_form.dart';
import 'package:organaiser/ui/login_screen/card_fact_widget/card_fact.dart';

part 'login_mobile.dart';
part 'login_pc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();
  final LoginBloc _bloc = LoginBloc();

  @override
  void initState() {
    super.initState();
    loginController.addListener(() => setState(() {}));
    passwordController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return BlocListener(
        bloc: _bloc,
        listener: (context, state) {
          if (state is SuccesState) {
            debugPrint(
                "From SuccesState: Data true for user login\nGo to HomeMobileRoute");
            router.replace(const HomeScreenRoute());
          }
          if (state is FailureState) {
            debugPrint(
                "From FailureState: Data false for user login\nShow alert dialog");
            showErrorDialog(context);
          }
          if (state is ServerProblemState) {
            debugPrint(
                "From ServerProblemState: Kundelik don`t work\nWe can do nothing!");
          }
        },
        child: Scaffold(body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth <= 600) {
                return NewLoginMobileScreen(
                    loginController: loginController,
                    passwordController: passwordController,
                    globalKey: globalKey,
                    loginBloc: _bloc);
              } else {
                return LoginPcScreen(
                    loginController: loginController,
                    passwordController: passwordController,
                    globalKey: globalKey,
                    loginBloc: _bloc);
              }
            },
          ),
        )));
  }

  Future<dynamic> showErrorDialog(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                appLocal.error_to_login,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.error),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(appLocal.message_ok),
                )
              ],
            ));
  }
}
