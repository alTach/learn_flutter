import 'dart:convert';

import 'package:udemy/core/error/exception.dart';
import 'package:udemy/feature/data/models/person_modal.dart';
import 'package:http/http.dart' as http;

abstract class PersonRemoveDataSource {
  Future<List<PersonModal>> getAllPersons(int page);
  Future<List<PersonModal>> searchPersons(String query);
}

class PersonRemoteDataSourceImp extends PersonRemoveDataSource {
  final http.Client client;
  PersonRemoteDataSourceImp({required this.http});

  @override
  Future<List<PersonModal>> getAllPersons(int page) => _getPersonFromUrl('https://rickandmortyapi.com/api/character?page=$page');

  @override
  Future<List<PersonModal>> searchPersons(String query) => _getPersonFromUrl('https://rickandmortyapi.com/api/character?name=$query');

  Future<List<PersonModal>> _getPersonFromUrl(String url) async {
    print(url);
    final response = await client.get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final persons = jsonDecode(response.body);
      return (persons['results'] as List).map((person) => PersonModal.fromJson(person)).toList();
    } else {
      throw ServerException();
    }
  }

}
