import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserProvider {
  // http://jsonplaceholder.typicode.com/users

  Future<List<User>> getUser() async {
    final response = await http.get(Uri.parse('http://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}