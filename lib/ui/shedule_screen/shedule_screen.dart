import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:organaiser/domain/model/shedule.dart';
import 'package:organaiser/ui/general_ui_widget/error_widgets/error_widget.dart';
import 'package:organaiser/ui/general_ui_widget/error_widgets/error_wifi_widget.dart';
import 'package:organaiser/ui/general_ui_widget/load_widget/my_load_widget.dart';
import 'package:organaiser/ui/shedule_screen/bloc/shedule_bloc.dart';

part 'mobile.dart';

@RoutePage()
class SheduleScreen extends StatefulWidget {
  const SheduleScreen({super.key});

  @override
  State<SheduleScreen> createState() => _SheduleScreenState();
}

class _SheduleScreenState extends State<SheduleScreen> {
  final SheduleBloc _bloc = SheduleBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(OnGetShedule());
  }

  void retry() {
    _bloc.add(OnGetShedule());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc, 
      builder: (context, state) {
        if (state is SuccesState) {
          return SheduleMobilePage(sheduleBloc: _bloc, shedule: state.shedule);
        }

        if (state is FailureState) {
          return MyErrorWidget(onTap: retry);
        }

        if (state is ConnectionProblemState) {
          return MyErrorWifiWidget(onTap: retry);
        }

        return const MyLoadWidget();
      }
    );
  }
}
