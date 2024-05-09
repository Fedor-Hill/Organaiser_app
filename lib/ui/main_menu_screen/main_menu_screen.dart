import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/user/user.dart';
import 'package:organaiser/ui/general_ui_widget/error_widgets/error_widget.dart';
import 'package:organaiser/ui/general_ui_widget/error_widgets/error_wifi_widget.dart';
import 'package:organaiser/ui/general_ui_widget/line_info/my_line_info.dart';
import 'package:organaiser/ui/general_ui_widget/load_widget/my_load_widget.dart';
import 'package:organaiser/ui/main_menu_screen/bloc/main_menu_bloc.dart';
import 'package:organaiser/ui/main_menu_screen/list_recent_marks_widget/list_recent_marks.dart';
import 'package:organaiser/ui/main_menu_screen/stats_widget/stats_last_mark.dart';

part 'mobile.dart';
part 'pc.dart';

@RoutePage()
class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final MainMenuBloc _bloc = MainMenuBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(RefreshEvent(completer: null));
  }

  void retry() {
    _bloc.add(RefreshEvent(completer: null));
  }

  Future<void> onRefresh() async {
    final Completer completer = Completer();
    _bloc.add(RefreshEvent(completer: completer));
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is SuccesState) {
          return RefreshIndicator(
              onRefresh: () => onRefresh(),
              child: const MainMenuMobileScreen());
        }

        if (state is FailureState) {
          return MyErrorWidget(onTap: retry);
        }

        if (state is ConnectionProblemState) {
          return MyErrorWifiWidget(onTap: retry);
        }

        return const MyLoadWidget();
      },
    );
  }
}
