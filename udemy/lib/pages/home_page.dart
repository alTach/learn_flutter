// import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../services/user_repository.dart';
import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    // return BlocProvider<UserBloc>(
    //   create: (context) => UserBloc(usersRepository),
    //   child: Scaffold(
    //     backgroundColor: Colors.white,
    //     appBar: AppBar(
    //       title: Text('Users List'),
    //       centerTitle: true,
    //     ),
    //     body: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         ActionButtons(),
    //         Expanded(child: UserList()),
    //       ],
    //     ),
    //   ),
    // );
    return BlocProvider(
      create: (context) => UserBloc(usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
