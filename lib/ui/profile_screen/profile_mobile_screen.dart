part of 'profile_screen.dart';


class ProfileMobileScreen extends StatelessWidget {
  const ProfileMobileScreen({super.key});

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://t.me/+Y6dKC5uCe-lkMTky');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void _logOut(BuildContext context) => showDialog(
      context: context,
      builder: (context) => const LoginOutDialog()
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final appLocal = AppLocalizations.of(context)!;
    final UserModel user = GetIt.I<AuthorizedUser>().user;

    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 64,
                  child: CircleAvatar(
                    radius: 62,
                    backgroundImage: NetworkImage(user.avatarUrl),
                    backgroundColor: theme.colorScheme.surface
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${user.lastName} ${user.firstName} ${user.middleName}",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge
                ),
                Text(
                  user.schoolName,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium
                ),
                Text(
                  appLocal.userClass(user.eduGroup.name),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium
                )
              ],
            ),
          ),
        ),
        //----------------------------------------------------------------
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Flexible(
                  flex: 6,
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const StatsScreen()
                      )
                    ),
                    title: const Icon(Icons.query_stats_rounded, size: 64),
                    titleAlignment: ListTileTitleAlignment.center,
                    subtitle: Text(
                      appLocal.my_statistics,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 4,
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const MyClassmateScreen()
                      )
                    ),
                    title: const Icon(Icons.groups_rounded, size: 64),
                    titleAlignment: ListTileTitleAlignment.center,
                    subtitle: Text(
                      appLocal.my_class,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleMedium
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //--------------------------------------------------------
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          sliver: SliverToBoxAdapter(
            child: ListTile(
              onTap: () => _launchUrl(),
              title: Text(
                "Telegram",
                style: theme.textTheme.titleMedium
              ),
              leading: const Icon(Icons.telegram_rounded),
              trailing: const Icon(Icons.arrow_right_rounded),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: ListTile(
              onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const SettingScreen()
                )
              ),
              title: Text(
                appLocal.title_setting,
                style: theme.textTheme.titleMedium
              ),
              leading: const Icon(Icons.settings_rounded),
              trailing: const Icon(Icons.arrow_right_rounded),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          sliver: SliverToBoxAdapter(
            child: ListTile(
              onTap: () => _logOut(context),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.error
                )
              ),
              title: Text(
                appLocal.logOut,
                style: theme.textTheme.titleMedium
              ),
              trailing: const Icon(Icons.exit_to_app_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
