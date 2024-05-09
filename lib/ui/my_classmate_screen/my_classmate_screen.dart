import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/person.dart';
import 'package:organaiser/ui/general_ui_widget/error_widgets/error_widget.dart';
import 'package:organaiser/ui/general_ui_widget/load_widget/my_load_widget.dart';
import 'package:organaiser/ui/my_classmate_screen/bloc/classmate_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'mobile.dart';

class MyClassmateScreen extends StatefulWidget {
  const MyClassmateScreen({super.key});

  @override
  State<MyClassmateScreen> createState() => _MyClassmateScreen();
}

class _MyClassmateScreen extends State<MyClassmateScreen> {
  final ClassmateBloc _bloc = ClassmateBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(GetClassmateEvent());
  }

  void onTap() {
    _bloc.add(GetClassmateEvent());
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: Text(
        AppLocalizations.of(context)!.title_person,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
    );
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is SuccesState) {
          return const MyClassmateMobileScreen();
        }

        if (state is FailureState) {
          return MyErrorWidget(appBar: appBar, onTap: onTap);
        }

        return Scaffold(appBar: appBar, body: const MyLoadWidget());
      },
    );
  }
}
