import 'dart:convert';

import 'package:udemy/core/error/exception.dart';
import 'package:udemy/feature/data/models/person_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModal>> getLastPersonsFromCache();
  Future<void> personsToCache(List<PersonModal> persons);
}

const CACHED_PERSONS_LIST = 'CACHED_PERSONS_LIST';
class PersonLocalDataSourceIml extends PersonLocalDataSource {
  SharedPreferences sharedPreferences;

  PersonLocalDataSourceIml({required this.sharedPreferences});
  @override
  Future<List<PersonModal>> getLastPersonsFromCache() {
    final jsonPersonsList = sharedPreferences.getStringList(CACHED_PERSONS_LIST);
    if (jsonPersonsList?.isNotEmpty ?? false) {
      return Future.value((jsonPersonsList as List<String>).map((person) => PersonModal.fromJson(jsonDecode(person))).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> personsToCache(List<PersonModal> persons) {
    final List<String> jsonPersonString = persons.map((person) => jsonEncode(person.toJson())).toList();
    sharedPreferences.setStringList(CACHED_PERSONS_LIST, jsonPersonString);
    print('Person write to Cache: ${jsonPersonString.length}');
    return Future.value(jsonPersonString);
  }

}
