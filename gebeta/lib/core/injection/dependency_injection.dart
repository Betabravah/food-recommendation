import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasource/local/local_datasource.dart';
import '../../features/auth/data/datasource/local/local_datasource_impl.dart';
import '../../features/auth/data/datasource/remote/remote_datasoucre_impl.dart';
import '../../features/auth/data/datasource/remote/remote_datasource.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/repository/auth_repository.dart';
import '../../features/auth/domain/usecases/get_token.dart';
import '../../features/auth/domain/usecases/login.dart';
import '../../features/auth/domain/usecases/logout.dart';
import '../../features/auth/domain/usecases/signup.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/food/data/datasources/local/local_datasource.dart';
import '../../features/food/data/datasources/local/local_datasource_impl.dart';
import '../../features/food/data/datasources/remote/remote_datasoucre.dart';
import '../../features/food/data/datasources/remote/remote_datasource_impl.dart';
import '../../features/food/data/repository/food_repository_impl.dart';
import '../../features/food/domain/repository/food_repository.dart';
import '../../features/food/domain/usecases/filter_foods.dart';
import '../../features/food/domain/usecases/get_food.dart';
import '../../features/food/domain/usecases/get_foods.dart';
import '../../features/food/presentation/bloc/food_bloc.dart';
import '../../features/user/data/datasources/local/local_datasource.dart';
import '../../features/user/data/datasources/local/local_datasource_impl.dart';
import '../../features/user/data/datasources/remote/remote_datasource.dart';
import '../../features/user/data/datasources/remote/remote_datasource_impl.dart';
import '../../features/user/data/repository/user_repository_impl.dart';
import '../../features/user/domain/repository/user_repository.dart';
import '../../features/user/domain/usecases/get_user.dart';
import '../../features/user/domain/usecases/update_user.dart';
import '../../features/user/presentation/bloc/user_bloc.dart';
import '../constants/constants.dart';
import '../network/custom_client.dart';
import '../network/network_info.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Core
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton<CustomClient>(
    () => CustomClient(serviceLocator(), apiBaseUrl: apiBaseUrl),
  );

  // Feature-User
  //! Bloc
  serviceLocator.registerFactory(
    () => UserBloc(
      getUser: serviceLocator(),
      updateUser: serviceLocator(),
    ),
  );

  //! Use cases
  serviceLocator.registerLazySingleton(
    () => GetUser(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => UpdateUser(serviceLocator()),
  );

  //! Repository
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
    ),
  );

  //! Data sources
  serviceLocator.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: serviceLocator()),
  );

  // Feature-Food
  //! Bloc

  // Repository
  serviceLocator.registerLazySingleton<FoodRepository>(
    () => FoodRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  // Bloc
  serviceLocator.registerFactory(
    () => FoodBloc(
      getFood: serviceLocator(),
      filterFoods: serviceLocator(),
      getAllFoods: serviceLocator(),
    ),
  );

  // Use cases
  serviceLocator.registerLazySingleton(
    () => GetFood(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetFoods(serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => FilterFoods(serviceLocator()),
  );

  // Data sources
  serviceLocator.registerLazySingleton<FoodLocalDataSource>(
    () => FoodLocalDatasourceImpl(sharedPreferences: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<FoodRemoteDataSource>(
    () => FoodRemoteDatasourceImpl(client: serviceLocator()),
  );

  // Feature-Authentication
  //! Bloc
  serviceLocator.registerFactory(
    () => AuthBloc(
      getToken: serviceLocator(),
      login: serviceLocator(),
      signup: serviceLocator(),
      logout: serviceLocator(),
      customClient: serviceLocator(),
    ),
  );

  //! Use cases
  serviceLocator.registerLazySingleton(
    () => Login(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => Signup(
      repository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetToken(
      serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => Logout(
      repository: serviceLocator(),
    ),
  );

  //! Repository
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );

  //! Data sources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      sharedPreferences: serviceLocator(),
    ),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker());
  serviceLocator.registerLazySingleton(() => http.Client());
}
