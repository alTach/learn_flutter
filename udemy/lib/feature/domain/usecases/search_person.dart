import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:udemy/feature/domain/repositories/person_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecases.dart';
import '../entities/person_entity.dart';

class SearchPersons extends UserCase<List<PersonEntity>, SearchPersonParams> {
  final PersonRepository personRepository;

  SearchPersons(this.personRepository);

  Future<Either<Failure, List<PersonEntity>>> call(SearchPersonParams params) async {
    return await personRepository.searchPerson(params.query);
  }
}

class SearchPersonParams extends Equatable {
  final String query;

  SearchPersonParams({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];

}