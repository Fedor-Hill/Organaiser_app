import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/domain/model/person_model/person_model.dart';
import 'package:organaiser/ui/screen_error/var_error/var_error.dart';
import 'package:organaiser/ui/screen_load/screen_load.dart';
import 'package:organaiser/ui/screen_my_persons/bloc/person_bloc.dart';

part 'my_persons_mobile.dart';

class MyPersonsScreen extends StatefulWidget {
  const MyPersonsScreen({super.key, required this.userContextModel});

  final UserContextModel userContextModel;
  @override
  State<MyPersonsScreen> createState() => _MyPersonsScreen();
}

class _MyPersonsScreen extends State<MyPersonsScreen> {
  final PersonBloc _personBloc = PersonBloc();

  @override
  void initState() {
    super.initState();
    _personBloc
        .add(OnGetPersonsEvent(userContextModel: widget.userContextModel));
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: Text(
        AppLocalizations.of(context)!.title_person,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back)),
    );
    return BlocBuilder(
      bloc: _personBloc,
      builder: (context, state) {
        if (state is SuccesState) {
          return MyPersonsMobileScreen(list: state.list);
        }

        if (state is FailureState) {
          return VarErrorScreen(appBar: appBar, funcRetry: retry);
        }

        return const Scaffold(body: LoadScreen());
      },
    );
  }

  void retry() {
    _personBloc
        .add(OnGetPersonsEvent(userContextModel: widget.userContextModel));
  }
}
