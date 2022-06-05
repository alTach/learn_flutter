
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/feature/domain/entities/person_entity.dart';
import 'package:udemy/feature/presentation/block/person_list_cuit/person_list_state.dart';

import '../../../../core/error/failure.dart';
import '../../../domain/usecases/get_all_persons.dart';

class PersonListCubit extends Cubit<PersonState> {
  final GetAllPersons getAllPersons;
  PersonListCubit({required this.getAllPersons}) : super(PersonEmpty());
  int page = 1;

  void loadPerson() async {
    if (state is PersonLoading) return;
    final currentState = state;

    var oldPerson = <PersonEntity>[];
    if(currentState is PersonLoaded) {
      oldPerson = currentState.personsList;
    }
    emit(PersonLoading(oldPerson, isFirstFetch: page == 1));

    final failureOrPerson = await getAllPersons(PagePersonParams(page: page));
    failureOrPerson.fold((failure) => PersonError(message: _mapFailureToMessage(failure)), (character) {
      page++;
      final persons = (state as PersonLoading).oldPersonList;
      persons.addAll(character);
      emit(PersonLoaded(persons));
    });


  }

  String _mapFailureToMessage(Failure failure) {
    switch(failure.runtimeType) {
      case ServerFailure: return 'Server failure';
      case CacheFailure: return 'Cache failure';
      default: return 'Unexpected failure';
    }
  }

}
