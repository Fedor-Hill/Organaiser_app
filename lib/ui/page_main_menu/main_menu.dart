import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:organaiser/ui/page_main_menu/bloc/mm_bloc.dart';
import 'package:organaiser/ui/screen_load/screen_load.dart';

//Model
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/domain/model/recent_mark_model/recent_mark_model.dart';

import 'package:organaiser/ui/page_main_menu/list_mark/list_mark.dart';
import 'package:organaiser/ui/screen_error/var_error/var_error.dart';

part 'main_menu_pc.dart';
part 'main_menu_mobile.dart';

@RoutePage()
class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key, required this.userContextModel});
  final UserContextModel userContextModel;

  @override
  State<MainMenuPage> createState() => _MainMenuPage();
}

class _MainMenuPage extends State<MainMenuPage> {
  final MainMenuBloc _mainMenuBloc = MainMenuBloc();

  @override
  void initState() {
    _mainMenuBloc.add(OnRefreshEvent(
        userContextModel: widget.userContextModel, completer: null));
    super.initState();
  }

  Future<void> onRefresh() async {
    final completer = Completer();
    _mainMenuBloc.add(OnRefreshEvent(
        userContextModel: widget.userContextModel, completer: completer));
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _mainMenuBloc,
      builder: (context, state) {
        if (state is LoadingState) {
          return const LoadScreen();
        }
        if (state is SuccesState) {
          /* return ListMark(list: state.recentMarkModelList); */
          return LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return RefreshIndicator(
                  onRefresh: () => onRefresh(),
                  child: MainMenuMobilePage(
                      userContextModel: widget.userContextModel,
                      midValue: state.midValue,
                      weekMood: state.weekMood,
                      list: state.recentMarkModelList));
            } else {
              return MainMenuPcPage(
                  userContextModel: widget.userContextModel,
                  mainMenuBloc: _mainMenuBloc,
                  list: state.recentMarkModelList,
                  midValue: state.midValue,
                  weekMood: state.weekMood);
            }
          });
        }
        if (state is FailureState) {
          return VarErrorScreen(appBar: null, funcRetry: retry);
        }
        return const LoadScreen();
      },
    );
  }

  void retry() {
    _mainMenuBloc.add(OnRefreshEvent(
        userContextModel: widget.userContextModel, completer: null));
  }
}
