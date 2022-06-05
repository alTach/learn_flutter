import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/feature/presentation/block/person_list_cuit/person_list_cuit.dart';
import 'package:udemy/feature/presentation/block/search_bloc/search_bloc.dart';
import 'package:udemy/locator_service.dart' as di;

import 'feature/presentation/pages/person_screan.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PersonListCubit>(create: (context) => sl<PersonListCubit>()),
      BlocProvider<PersonSearchBloc>(create: (context) => sl<PersonSearchBloc>()),
    ], child: MaterialApp(
      theme: ThemeData.dark().copyWith(backgroundColor: Colors.black, scaffoldBackgroundColor: Colors.grey),
      home: HomePage(),
    ));
  }
}
