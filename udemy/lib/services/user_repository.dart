import 'package:udemy/services/user_api_provider.dart';

import '../models/user.dart';

class UsersRepository {
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}