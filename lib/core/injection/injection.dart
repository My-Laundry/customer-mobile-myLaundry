// import 'package:data_connection_checker_tv/data_connection_checker.dart';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:learn_bloc/core/connection/network_info.dart';
// import 'package:learn_bloc/features/bottom_nav_bar/presentation/cubit/bottom_nav_bar_cubit.dart';
// import 'package:learn_bloc/features/home/data/datasources/user_local_data_source.dart';
// import 'package:learn_bloc/features/home/data/datasources/user_remote_data_source.dart';
// import 'package:learn_bloc/features/home/data/repositories/user_repository_impl.dart';
// import 'package:learn_bloc/features/home/domain/repositories/user_repository.dart';
// import 'package:learn_bloc/features/home/domain/usecases/get_all_users.dart';
// import 'package:learn_bloc/features/home/domain/usecases/get_user_by_id.dart';
// import 'package:learn_bloc/features/home/presentation/cubit/home_cubit.dart';
// import 'package:learn_bloc/features/home/presentation/user_cubit/user_cubit.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final getIt = GetIt.instance;

// Future<void> setupInjection() async {
//   // Register Dio for network requests
//   getIt.registerSingleton<Dio>(Dio());
//   getIt.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
//   getIt.registerSingleton<NetworkInfo>(
//       NetworkInfoImpl(getIt<DataConnectionChecker>()));

//   // Register SharedPreferences
//   final sharedPreferences = await SharedPreferences.getInstance();
//   getIt.registerSingleton<SharedPreferences>(sharedPreferences);

//   // Register remote data source
//   getIt.registerSingleton<UserRemoteDataSource>(
//       UserRemoteDataSourceImpl(dio: getIt<Dio>()));

//   // Register local data source
//   getIt.registerSingleton<UserLocalDataSource>(
//       UserLocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()));

//   // Register repository
//   getIt.registerSingleton<UserRepository>(UserRepositoryImpl(
//     remoteDataSource: getIt<UserRemoteDataSource>(),
//     localDataSource: getIt<UserLocalDataSource>(),
//     networkInfo: getIt<NetworkInfo>(),
//   ));

//   // Register use cases
//   getIt.registerSingleton<GetAllUsers>(
//       GetAllUsers(repository: getIt<UserRepository>()));

//   // Register cubits
//   getIt.registerFactory<HomeCubit>(
//       () => HomeCubit(getAllUsers: getIt<GetAllUsers>()));
//   getIt.registerFactory<UserCubit>(
//       () => UserCubit(getUserByID: getIt<GetUserByID>()));
//   getIt.registerFactory<BottomNavBarCubit>(() => BottomNavBarCubit());
// }

import 'package:customer_laundry_app/features/auth/data/repositories/auth_repository_implement.dart';
import 'package:customer_laundry_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:customer_laundry_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:customer_laundry_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:customer_laundry_app/features/main/presentation/bloc/main_bloc.dart';
import 'package:customer_laundry_app/features/order/presentation/bloc/order_bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../connection/network_info.dart';

final getIt = GetIt.instance;

Future<void> setupInjection() async {
  // Register Dio for network requests
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  getIt.registerSingleton<NetworkInfo>(
      NetworkInfoImpl(getIt<DataConnectionChecker>()));

  // Register SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register remote data source
  getIt.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl(dio: getIt<Dio>()));

  // Register remote data source
  // getIt.registerSingleton<UserRemoteDataSource>(
  //     UserRemoteDataSourceImpl(dio: getIt<Dio>()));

  // Register local data source
  // getIt.registerSingleton<UserLocalDataSource>(
  //     UserLocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()));

  // // Register repository
  // getIt.registerSingleton<UserRepository>(UserRepositoryImpl(
  //   remoteDataSource: getIt<UserRemoteDataSource>(),
  //   localDataSource: getIt<UserLocalDataSource>(),
  //   networkInfo: getIt<NetworkInfo>(),
  // ));

  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(
    authRemoteDataSource: getIt<AuthRemoteDataSource>(),
    networkInfo: getIt<NetworkInfo>(),
  ));

  // Register use cases
  // getIt.registerSingleton<GetAllUsers>(
  //     GetAllUsers(repository: getIt<UserRepository>()));
  // getIt.registerSingleton<GetUserByID>(
  //     GetUserByID(repository: getIt<UserRepository>()));
  // getIt.registerSingleton<RegisterUsecase>(
  //     RegisterUsecase(repository: getIt<AuthRepository>()));

  // // Register cubits
  // getIt.registerFactory<HomeCubit>(
  //     () => HomeCubit(getAllUsers: getIt<GetAllUsers>()));
  // getIt.registerFactory<UserCubit>(
  //     () => UserCubit(getUserByID: getIt<GetUserByID>()));
  // getIt.registerFactory<BottomNavBarCubit>(() => BottomNavBarCubit());

  // Register bloc
  getIt.registerFactory<AuthBloc>(() => AuthBloc(
      registerUsecase: AuthUsecase(repository: getIt<AuthRepository>())));
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
  getIt.registerFactory<MainBloc>(() => MainBloc());
  getIt.registerFactory<OrderBloc>(() => OrderBloc());
}
