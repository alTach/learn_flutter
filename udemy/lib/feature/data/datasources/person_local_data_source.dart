import 'dart:convert';

import 'package:udemy/core/error/exception.dart';
import 'package:udemy/feature/data/models/person_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModel>> getLastPersonsFromCache();
  Future<void> personsToCache(List<PersonModel> persons);
}

const CACHED_PERSONS_LIST = 'CACHED_PERSONS_LIST';
class PersonLocalDataSourceIml extends PersonLocalDataSource {
  SharedPreferences sharedPreferences;

  PersonLocalDataSourceIml({required this.sharedPreferences});
  @override
  Future<List<PersonModel>> getLastPersonsFromCache() {
    final jsonPersonsList = sharedPreferences.getStringList(CACHED_PERSONS_LIST);
    if (jsonPersonsList != null) {
      return Future.value(jsonPersonsList.map((person) => PersonModel.fromJson(jsonDecode(person))).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> personsToCache(List<PersonModel> persons) {
    final List<String> jsonPersonsList = persons.map((person) => jsonEncode(person.toJson())).toList();
    sharedPreferences.setStringList(CACHED_PERSONS_LIST, jsonPersonsList);
    print('Person write to Cache: ${jsonPersonsList.length}');
    return Future.value(jsonPersonsList);
  }

}
