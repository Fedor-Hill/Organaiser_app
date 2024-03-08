import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/person_model/person_model.dart';
import 'package:organaiser/domain/model/user_context_model/user_context.dart';
import 'package:organaiser/domain/repository/kundelik/data_repository.dart';

part 'person_state.dart';
part 'person_event.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(InitialState()) {

    on<OnGetPersonsEvent>(
      (event, emit) async {
        try {
          final List<PersonModel> list = await GetIt.I<PersonsRepository>()
              .getPersons(event.userContextModel.groupId);
          emit(SuccesState(list: list));
        } catch (e) {
          emit(FailureState());
        }
      },
    );

  }
}
