import 'package:dartz/dartz.dart';
import 'package:udemy/core/error/exception.dart';

import 'package:udemy/core/error/failure.dart';
import 'package:udemy/core/platform/network_info.dart';

import 'package:udemy/feature/domain/entities/person_entity.dart';

import '../../domain/repositories/person_repository.dart';
import '../datasources/person_local_data_source.dart';
import '../datasources/person_remote_data_source.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await remoteDataSource.getAllPersons(page);
        localDataSource.personsToCache(remotePerson);
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPerson = await localDataSource.getLastPersonsFromCache();
        return Right(localPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) {
    // TODO: implement searchPerson
    throw UnimplementedError();
  }

}
