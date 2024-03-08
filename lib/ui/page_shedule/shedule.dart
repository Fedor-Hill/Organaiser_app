import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:organaiser/domain/model/shedule_model/shedule_model.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/ui/page_shedule/bloc/shedule_bloc.dart';
import 'package:organaiser/ui/screen_error/var_error/var_error.dart';
import 'package:organaiser/ui/screen_load/screen_load.dart';

part 'shedule_mobile.dart';

@RoutePage()
class ShedulePage extends StatefulWidget {
  const ShedulePage({super.key, required this.userContextModel});
  final UserContextModel userContextModel;

  @override
  State<ShedulePage> createState() => _ShedulePage();
}

class _ShedulePage extends State<ShedulePage> {
  late final SheduleBloc _sheduleBloc =
      SheduleBloc(userContextModel: widget.userContextModel);

  @override
  void initState() {
    _sheduleBloc.add(OnGetShedule());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _sheduleBloc,
        builder: (event, state) {
          if (state is LoadingState) {
            return const LoadScreen();
          }
          if (state is SuccesState) {
            return SheduleMobilePage(
              sheduleBloc: _sheduleBloc,
              sheduleModel: state.sheduleModel,
            );
          }
          if (state is FailureState) {
            return VarErrorScreen(appBar: null, funcRetry: retry);
          }
          return const LoadScreen();
        });
  }

  void retry() {
    _sheduleBloc.add(OnGetShedule());
  }
}
