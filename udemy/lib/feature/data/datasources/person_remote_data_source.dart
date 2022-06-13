import 'dart:convert';

import 'package:udemy/core/error/exception.dart';
import 'package:udemy/feature/data/models/person_modal.dart';
import 'package:http/http.dart' as http;

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons(int page);
  Future<List<PersonModel>> searchPersons(String query);
}

class PersonRemoteDataSourceImp extends PersonRemoteDataSource {
  final http.Client client;
  PersonRemoteDataSourceImp({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons(int page) => _getPersonFromUrl('https://rickandmortyapi.com/api/character?page=$page');

  @override
  Future<List<PersonModel>> searchPersons(String query) => _getPersonFromUrl('https://rickandmortyapi.com/api/character?name=$query');

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    print(url);
    final response = await client.get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final persons = jsonDecode(response.body);
      return (persons['results'] as List).map((person) => PersonModel.fromJson(person)).toList();
    } else {
      throw ServerException();
    }
  }
}
