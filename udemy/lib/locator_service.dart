import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemy/core/platform/network_info.dart';
import 'package:udemy/feature/data/datasources/person_local_data_source.dart';
import 'package:udemy/feature/data/datasources/person_remote_data_source.dart';
import 'package:udemy/feature/data/repositories/person_repository_impl.dart';
import 'package:udemy/feature/domain/repositories/person_repository.dart';
import 'package:udemy/feature/domain/usecases/get_all_persons.dart';
import 'package:udemy/feature/domain/usecases/search_person.dart';
import 'package:udemy/feature/presentation/block/search_bloc/search_bloc.dart';

import 'feature/presentation/block/person_list_cuit/person_list_cuit.dart';
import 'package:http/http.dart' as http;


final sl = GetIt.instance;

Future<void> init() async {
  // Bloc /Cubit
  sl.registerFactory(() => PersonListCubit(getAllPersons: sl()),);
  sl.registerFactory(() => PersonSearchBloc(searchPerson: sl()),);

  // Use case
  sl.registerLazySingleton(() => GetAllPersons(sl()));
  sl.registerLazySingleton(() => SearchPerson(sl()));

  // Repository
  sl.registerLazySingleton<PersonRepository>(() => PersonRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl()
  ));
  sl.registerLazySingleton<PersonRemoteDataSource>(() => PersonRemoteDataSourceImp(client: http.Client()));
  sl.registerLazySingleton<PersonLocalDataSource>(() => PersonLocalDataSourceIml(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() async => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
