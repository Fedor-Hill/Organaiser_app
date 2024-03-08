part of 'setting.dart';

class SettingMobileScreen extends StatefulWidget {
  const SettingMobileScreen({super.key});

  @override
  State<SettingMobileScreen> createState() => _SettingMobileScreen();
}

class _SettingMobileScreen extends State<SettingMobileScreen> {
  late final SharedPreferences prefs;

  void getShared() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    getShared();

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocal.title_setting),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.language_rounded, color: theme.colorScheme.primary),
            title: Text(appLocal.options_set_language,
                style: theme.textTheme.titleLarge),
            subtitle: Text(appLocal.options_prompt_restart,
                style: theme.textTheme.bodyMedium),
            trailing: PopupMenuButton(
              onSelected: (item) => onLanguageMenuItemClick(item),
              itemBuilder: (context) => [
                PopupMenuItem(
                    value: 0, child: Text(appLocal.options_menu_lang_ru)),
                PopupMenuItem(
                    value: 1, child: Text(appLocal.options_menu_lang_en))
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.format_paint_rounded, color: theme.colorScheme.primary),
            title: Text(appLocal.options_set_theme_app, style: theme.textTheme.titleLarge),
            trailing: PopupMenuButton(
              onSelected: (item) => onThemeMenuItemClick(item),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Text(appLocal.options_menu_theme_light),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text(appLocal.options_menu_theme_dark),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void onLanguageMenuItemClick(int item) {
    switch (item) {
      case 0:
        prefs.setString("locale", "ru");
        break;
      case 1:
        prefs.setString("locale", "en");
        break;
    }
  }

  void onThemeMenuItemClick(int item) {
    switch (item) {
      case 0:
        AdaptiveTheme.of(context).setLight();
        break;
      case 1: 
        AdaptiveTheme.of(context).setDark();
        break;
    }
  }
}
