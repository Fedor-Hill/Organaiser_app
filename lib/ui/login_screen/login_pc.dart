part of 'login.dart';

class LoginPcScreen extends StatefulWidget {
  const LoginPcScreen(
      {super.key,
      required this.loginController,
      required this.passwordController,
      required this.globalKey,
      required this.loginBloc});
  final TextEditingController loginController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;
  final LoginBloc loginBloc;

  @override
  State<LoginPcScreen> createState() => _LoginPcScreen();
}

class _LoginPcScreen extends State<LoginPcScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLocal = AppLocalizations.of(context)!;
    final double padding = MediaQuery.of(context).size.height * 0.2;

    return Form(
      key: widget.globalKey,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
              flex: 4,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: padding),
                      Text(
                        appLocal.wellcomeTo,
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        appLocal.nameApp,
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.left,
                        textScaler: const TextScaler.linear(1.44),
                      ),
                      const SizedBox(height: 20),
                      MyTextField(
                          controller: widget.loginController,
                          textInputType: TextInputType.text,
                          prefixIcon: const Icon(Icons.account_circle_rounded),
                          suffixIcon: widget.loginController.text.isEmpty
                              ? null
                              : IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () =>
                                      widget.loginController.clear(),
                                ),
                          labelText: appLocal.login,
                          hintText: appLocal.hint_login,
                          obscureText: false,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return appLocal.validator_empty_text;
                            }
                            return null;
                          }),
                      const SizedBox(height: 10),
                      MyTextField(
                          controller: widget.passwordController,
                          textInputType: TextInputType.text,
                          prefixIcon: const Icon(Icons.password_outlined),
                          suffixIcon: widget.passwordController.text.isEmpty
                              ? null
                              : IconButton(
                                  icon: obscureText
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                ),
                          labelText: appLocal.password,
                          hintText: appLocal.hint_password,
                          obscureText: obscureText,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return appLocal.validator_empty_text;
                            }
                            return null;
                          }),
                      const SizedBox(height: 20),
                      MyButton(
                        onTap: () => onClick(),
                        color: theme.colorScheme.primary,
                        child: Text(
                          appLocal.loginIn,
                          style: theme.textTheme.titleMedium!.copyWith(
                            color: theme.colorScheme.onBackground
                          ),
                          textAlign: TextAlign.center
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextButton(
                          onPressed: () => showTermUse(),
                          child: Text(appLocal.term_use),
                        ),
                      )
                    ],
                  ))),
          Expanded(flex: 6, child: Container(color: theme.colorScheme.surface))
        ],
      ),
    );
  }

  void onClick() {
    if (widget.globalKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Text(AppLocalizations.of(context)!.check_data,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center))));
      widget.loginBloc.add(ButtonPressedEvent(
          login: widget.loginController.text,
          password: widget.passwordController.text));
    }
  }

  void showTermUse() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(AppLocalizations.of(context)!.terms_of_use_short,
                  style: Theme.of(context).textTheme.titleMedium),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    AppLocalizations.of(context)!.message_ok,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )
              ],
            ));
  }
}
