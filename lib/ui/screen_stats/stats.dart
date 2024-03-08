import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/ui/screen_stats/bloc/stats_bloc.dart';

part 'stats_mobile.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key, required this.userContextModel});

  final UserContextModel userContextModel;

  @override
  State<StatsScreen> createState() => _StatsScreen();
}

class _StatsScreen extends State<StatsScreen> {
  late final StatsBloc _statsBloc;

  @override
  void initState() {

    super.initState();
    _statsBloc = StatsBloc(userContextModel: widget.userContextModel);
    // _statsBloc.add(BtnPressed());
    myFunc();
  }

  void myFunc() {
    _statsBloc.add(BtnPressed());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _statsBloc,
      builder: (context, state) {
        if (state is SuccesState) {}

        return StatsMobileScreen(func: myFunc);
      },
    );
  }
}
