import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy/feature/presentation/block/person_list_cuit/person_list_cuit.dart';
import 'package:udemy/feature/presentation/block/search_bloc/search_bloc.dart';
import 'package:udemy/locator_service.dart' as di;

import 'common/app_colors.dart';
import 'feature/presentation/pages/person_screan.dart';

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
      BlocProvider<PersonListCubit>(create: (context) => di.sl<PersonListCubit>()..loadPerson()),
      BlocProvider<PersonSearchBloc>(create: (context) => di.sl<PersonSearchBloc>()),
    ], child: MaterialApp(
      theme: ThemeData.dark().copyWith(backgroundColor: AppColors.mainBackground, scaffoldBackgroundColor: AppColors.mainBackground),
      home: HomePage(),
    ));
  }
}
