import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:organaiser/domain/repository/kundelik/user_repository.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/ui/screen_my_persons/my_persons.dart';
import 'package:organaiser/ui/screen_setting/setting.dart';

part 'profile_mobile.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userContextModel});
  final UserContextModel userContextModel;



  @override
  Widget build(BuildContext context) {
    return ProfileMobilePage(userContextModel: userContextModel);
  }
  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //     builder: (context, constraints) {
  //       if (constraints.maxWidth <= 600) {
  //         return ProfileMobilePage(userContextModel: userContextModel);
  //       } else {
  //         return ProfilePcPage(userContextModel: userContextModel);
  //       }
  //     }
  //   );
  // }
}
