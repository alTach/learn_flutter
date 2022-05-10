import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MyUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Future Provider example, users loaded from the file'),
          ),
          Consumer<List<User>>(builder: (context, List<User> users, _){
            return Expanded(
                child: users == null ? CircularProgressIndicator() : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) => Container(
                      height: 50,
                      color: Colors.grey[(index * 200) % 400],
                      child: Center(
                        child: Text('${users[index].first_name}-${users[index].last_name}-${users[index].website}'),
                      ),
                    ))
            );
          },)
        ],
      ),
    );
  }
}

class UserProvider {
  final String _dataPath = 'assets/user.json';
  List<User> users = [];

  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 10), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  Future<List<User>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    var users = UserList.fromJson(jsonUserData['users']);
    print('done load user!' + jsonEncode(users));
    return users as List<User>;
  }
}

class User {
  String first_name = '';
  String last_name = '';
  String website = '';

  User(first_name, last_name, website);

  User.fromJson(Map<String, dynamic> json)
      : this.first_name = json['first_name'],
        this.last_name = json['last_name'],
        this.website = json['website'];
}

class UserList {
  final List<User> users;

  UserList(this.users);

  UserList.fromJson(List<dynamic> userJson)
      : users = userJson.map((user) => User.fromJson(user)).toList();
}
