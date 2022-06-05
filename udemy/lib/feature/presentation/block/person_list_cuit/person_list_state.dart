import 'package:equatable/equatable.dart';

import '../../../domain/entities/person_entity.dart';

abstract class PersonState extends Equatable {

  PersonState();

  @override
  List<Object> get props => [];
}

class PersonEmpty extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonLoading extends PersonState {
  final List<PersonEntity> oldPersonList;
  final bool isFirstFetch;

  PersonLoading(this.oldPersonList, {this.isFirstFetch = false});
  @override
  List<Object> get props => [oldPersonList];
}

class PersonLoaded extends PersonState {
  final List<PersonEntity> personsList;

  PersonLoaded(this.personsList);
  @override
  List<Object> get props => [personsList];
}

class PersonError extends PersonState {
  final String message;

  PersonError({required this.message});
  @override
  List<Object> get props => [message];
}
