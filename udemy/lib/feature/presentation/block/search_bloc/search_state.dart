import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:udemy/feature/domain/entities/person_entity.dart';

abstract class PersonSearchState extends Equatable {

  PersonSearchState();

  @override
  List<Object> get props => [];
}

class PersonEmpty extends PersonSearchState{

}

class PersonSearchLoading extends PersonSearchState {

}

class PersonSearchLoaded extends PersonSearchState {
    final List<PersonEntity> persons;

    PersonSearchLoaded({required this.persons});
    @override
    List<Object> get props => [persons];
}

class PersonSearchError extends PersonSearchState {
  final String message;

  PersonSearchError({required this.message});
  @override
  List<Object> get props => [message];
}
