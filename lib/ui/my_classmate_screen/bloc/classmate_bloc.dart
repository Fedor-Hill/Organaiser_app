import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:organaiser/domain/model/person.dart';
import 'package:organaiser/domain/repository/user.dart';


part 'classmate_event.dart';
part 'classmate_state.dart';

class ClassmateBloc extends Bloc<ClassmateEvent, ClassmateState> {
  ClassmateBloc() : super(InitialState()) {

    on<GetClassmateEvent>((event, emit) async {
      if (!GetIt.I.isRegistered<PersonData>()) {
        try {
          final PersonData persons = await GetIt.I<UserRepository>().getClassmate();

          GetIt.I.registerSingleton<PersonData>(persons);

          emit(SuccesState());
        } catch(e) {
          emit(FailureState());
        }
      } else {
        emit(SuccesState());
      }
    });
  }
}
