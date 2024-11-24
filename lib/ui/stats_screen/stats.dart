import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/edu_group.dart';
import 'package:organaiser/domain/model/user/user.dart';
import 'package:organaiser/ui/general_ui_widget/error_widgets/error_widget.dart';
import 'package:organaiser/ui/general_ui_widget/load_widget/my_load_widget.dart';
import 'package:organaiser/ui/stats_screen/bloc/stats_bloc.dart';
import 'package:organaiser/ui/stats_screen/tab/final_tab.dart';
import 'package:organaiser/ui/stats_screen/tab/quarter_tab.dart';

part 'mobile.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreen();
}

class _StatsScreen extends State<StatsScreen> {
  final StatsBloc _bloc = StatsBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(FirstStartEvent());
  }

  void onTap() {
    _bloc.add(FirstStartEvent());
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: Text(
        AppLocalizations.of(context)!.my_statistics,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      automaticallyImplyLeading: true
    );

    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is SuccesState) {
          debugPrint("From Stats_Bloc: return SuccesState");
          return StatsMobileScreen(bloc: _bloc);
        }

        if (state is FailureState) {
          debugPrint("From Stats_Bloc: return FailureState");
          debugPrint("Error: ${state.e.toString()}");
          return MyErrorWidget(appBar: appBar, onTap: onTap);
        }

        if (state is LoadState) {
          debugPrint("From Stats_Bloc: return LoadState");
          return Scaffold(
            appBar: appBar,
            body: const MyLoadWidget()
          );
        }

        return Scaffold(appBar: appBar, body: const MyLoadWidget());
      }
    );
  }
}
