part of 'login.dart';

class NewLoginMobileScreen extends StatefulWidget {
  const NewLoginMobileScreen({
    super.key,
    required this.loginController,
    required this.passwordController,
    required this.globalKey,
    required this.loginBloc
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;
  final LoginBloc loginBloc;

  @override
  State<NewLoginMobileScreen> createState() => _NewLoginMobileScreenState();
}

class _NewLoginMobileScreenState extends State<NewLoginMobileScreen> {

  void onTap(BuildContext context, ThemeData theme, AppLocalizations appLocal) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) => LoginModalBottomSheet(
          theme: theme,
          appLocal: appLocal,
          loginBloc: widget.loginBloc,
          globalKey: widget.globalKey,
          passwordController: widget.passwordController,
          loginController: widget.loginController
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    final double topPad = MediaQuery.of(context).size.height * 0.1;
    final double horPad = MediaQuery.of(context).size.width * 0.2;
    final appLocal = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Name app
          SizedBox(height: topPad),
          // Text(
          //   appLocal.wellcomeTo,
          //   textAlign: TextAlign.center,
          //   style: theme.textTheme.titleMedium
          // ),
          // const SizedBox(height: 5),
          Text(
            appLocal.nameApp,
            textAlign: TextAlign.center,
            style: theme.textTheme.displaySmall
          ),
          const SizedBox(height: 5),
          Text(
            "Новое решение",
            style: theme.textTheme.bodyMedium
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horPad),
              child: const MyDoneFacts(),
            )
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horPad),
              child: MyButton(
                color: theme.colorScheme.secondary,
                onTap: () => onTap(
                  context,
                  theme,
                  appLocal
                ),
                child: Text(
                  "Начать",
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onBackground
                  ),
                  textAlign: TextAlign.center
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}

class LoginModalBottomSheet extends StatefulWidget {
  const LoginModalBottomSheet({super.key, required this.theme, required this.appLocal, required this.loginController, required this.passwordController, required this.globalKey, required this.loginBloc});

  final ThemeData theme; 
  final AppLocalizations appLocal;
  final TextEditingController loginController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;
  final LoginBloc loginBloc;

  @override
  State<LoginModalBottomSheet> createState() => _LoginModalBottomSheetState();
}

class _LoginModalBottomSheetState extends State<LoginModalBottomSheet> {
  bool obscureText = true;

  void onTap(BuildContext context) {
    if (widget.globalKey.currentState!.validate()) {
      widget.loginBloc.add(ButtonPressedEvent(
          login: widget.loginController.text,
          password: widget.passwordController.text));
      SnackBar snackBar = SnackBar(
          duration: Durations.long2,
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
                  textAlign: TextAlign.center)));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void showTermUse() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.terms_of_use_short,
          style: Theme.of(context).textTheme.titleMedium
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              AppLocalizations.of(context)!.message_ok,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    final double horPad = MediaQuery.of(context).size.width * 0.15;
    final appLocal = AppLocalizations.of(context)!;
    return Form(
      key: widget.globalKey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.72,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horPad),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Начнем",
                  style: widget.theme.textTheme.displaySmall!.copyWith(
                    color: widget.theme.colorScheme.secondary
                  )
                ),
                Text(
                  "*Логин и пароль от Кунделик\n(пока только для ученика)",
                  style: widget.theme.textTheme.bodyMedium!.copyWith(
                    color: widget.theme.colorScheme.error
                  ),
                  textAlign: TextAlign.center
                ),
                const SizedBox(height: 15),
                MyTextField(
                  controller: widget.loginController,
                  textInputType: TextInputType.text,
                  prefixIcon: const Icon(Icons.account_circle_rounded),
                  suffixIcon: widget.loginController.text.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () => widget.loginController.clear(),
                        ),
                  labelText: widget.appLocal.login,
                  hintText: widget.appLocal.hint_login,
                  obscureText: false,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return widget.appLocal.validator_empty_text;
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
                  labelText: widget.appLocal.password,
                  hintText: widget.appLocal.hint_password,
                  obscureText: obscureText,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return widget.appLocal.validator_empty_text;
                    }
                    return null;
                  }
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: MyButton(
                    color: Theme.of(context).colorScheme.primary,
                    onTap: () => onTap(context),
                    child: Text(
                      appLocal.loginIn,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => showTermUse(),
                  child: Text(widget.appLocal.term_use),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
