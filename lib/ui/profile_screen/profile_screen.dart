import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:organaiser/ui/my_classmate_screen/my_classmate_screen.dart';
import 'package:organaiser/ui/profile_screen/log_out_widget/log_out_widget.dart';
import 'package:organaiser/ui/setting_screen/setting.dart';
import 'package:organaiser/ui/stats_screen/stats.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:organaiser/domain/model/user/user.dart';

part 'profile_mobile_screen.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileMobileScreen();
  }
}
