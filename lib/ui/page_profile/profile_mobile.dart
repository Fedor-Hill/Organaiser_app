part of 'profile.dart';

class ProfileMobilePage extends StatelessWidget {
  const ProfileMobilePage({super.key, required this.userContextModel});
  final UserContextModel userContextModel;

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse('https://t.me/+Y6dKC5uCe-lkMTky');
    final appLocal = AppLocalizations.of(context)!;
    bool isAvatarSucces = true;
    final theme = Theme.of(context);

    Future<void> _launchUrl() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return CustomScrollView(physics: const ClampingScrollPhysics(), slivers: [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        sliver: SliverToBoxAdapter(
            child: Column(children: [
          CircleAvatar(
            radius: 64,
            backgroundColor: theme.colorScheme.primary,
            child: CircleAvatar(
              radius: 62,
              backgroundImage: NetworkImage(userContextModel.avatarUrl),
              onBackgroundImageError: (exception, stackTrace) => isAvatarSucces = false ,
              backgroundColor: theme.colorScheme.surface,
            ),
          ),
          Text(
              "${userContextModel.lastName} ${userContextModel.firstName} ${userContextModel.middleName}",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge),
          Text(userContextModel.schoolName, style: theme.textTheme.titleMedium),
          Text(appLocal.userClass(userContextModel.parallelStr),
              style: theme.textTheme.titleMedium)
        ])),
      ),

      //Row with two "button" (успеваемость и класс)
      SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          sliver: SliverToBoxAdapter(
              child: Row(children: [
            Flexible(
                flex: 6,
                child: ListTile(
                  title: const Icon(Icons.query_stats_outlined, size: 64),
                  titleAlignment: ListTileTitleAlignment.center,
                  subtitle: Text(
                    appLocal.my_statistics,
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  tileColor: theme.cardTheme.color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: theme.colorScheme.primary,
                      )),
                  // onTap: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => StatsScreen(
                  //             userContextModel: userContextModel))),
                  onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text(appLocal.inWorkingProcess,
                                style: theme.textTheme.titleMedium),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(appLocal.message_ok,
                                    style: theme.textTheme.titleMedium),
                              )
                            ],
                          )),
                )),
            const SizedBox(width: 10),
            Flexible(
              flex: 4,
              child: ListTile(
                title: const Icon(Icons.groups_outlined, size: 64),
                titleAlignment: ListTileTitleAlignment.center,
                subtitle: Text(
                  appLocal.my_class,
                  style: theme.textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                tileColor: theme.cardTheme.color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: theme.colorScheme.primary)),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyPersonsScreen(
                            userContextModel: userContextModel))),
              ),
            )
          ]))),

      //Column with buttons
      SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          sliver: SliverToBoxAdapter(
              child: Column(children: [
            ListTile(
              leading: Icon(Icons.settings_rounded,
                  color: theme.colorScheme.primary),
              title: Text(appLocal.title_setting,
                  style: theme.textTheme.titleMedium),
              trailing: const Icon(Icons.arrow_right),
              tileColor: theme.cardTheme.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: theme.colorScheme.primary)),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen())),
            ),
            const SizedBox(height: 10),
            ListTile(
                leading: Icon(Icons.telegram_sharp,
                    color: theme.colorScheme.primary),
                title: Text("Telegram", style: theme.textTheme.titleMedium),
                trailing: const Icon(Icons.arrow_right),
                tileColor: theme.cardTheme.color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: theme.colorScheme.primary)),
                onTap: () => _launchUrl()),
          ]))),

      // Exit button
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        sliver: SliverToBoxAdapter(
          child: ListTile(
            title: Text(appLocal.logOut, style: theme.textTheme.titleMedium),
            trailing: const Icon(Icons.exit_to_app_rounded),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: theme.colorScheme.error)),
            tileColor: theme.cardTheme.color,
            onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => const LoginOutDialog()),
          ),
        ),
      )
    ]);
  }
}

class LoginOutDialog extends StatelessWidget {
  const LoginOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final router = AutoRouter.of(context);
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(appLocal.logOut_message, style: theme.textTheme.titleMedium),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(appLocal.message_no, style: theme.textTheme.titleMedium),
        ),
        TextButton(
            onPressed: () async {
              await GetIt.I<UserRepository>().logOut();
              router.replaceNamed("/login");
            },
            child:
                Text(appLocal.message_yes, style: theme.textTheme.titleMedium))
      ],
    );
  }
}
