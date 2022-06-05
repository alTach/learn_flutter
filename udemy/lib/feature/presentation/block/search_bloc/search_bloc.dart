import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/core/error/failure.dart';
import 'package:udemy/feature/presentation/block/search_bloc/search_event.dart';
import 'package:udemy/feature/presentation/block/search_bloc/search_state.dart';

import '../../../domain/usecases/search_person.dart';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;
  PersonSearchBloc({required this.searchPerson}): super(PersonEmpty()) {
    on<SearchPersons>(_onEvent);
  }



  FutureOr<void> _onEvent(SearchPersons event, Emitter<PersonSearchState> emit)  async {
    emit(PersonSearchLoading());
    final failureOrPerson = await searchPerson(SearchPersonParams(query: event.personQuery));
    failureOrPerson.fold((failure) => PersonSearchError(message: _mapFailureToMessage(failure)), (person) => PersonSearchLoaded(persons: person));
  }

  String _mapFailureToMessage(Failure failure) {
    switch(failure.runtimeType) {
      case ServerFailure: return 'Server failure';
      case CacheFailure: return 'Cache failure';
      default: return 'Unexpected failure';
    }
  }
}
