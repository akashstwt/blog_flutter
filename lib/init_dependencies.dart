import 'package:blog_app/core/Secrets/app_secrets.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/repossitories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/user_login.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocater = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocater.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocater.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocater(),
    ),
  );

  serviceLocater.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocater(),
    ),
  );

  serviceLocater.registerFactory(
    () => UserSignUp(
      serviceLocater(),
    ),
  );

  serviceLocater.registerFactory(
    () => UserLogIn(
      serviceLocater(),
    ),
  );

  serviceLocater.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocater(),
      userLogIn: serviceLocater(),
    ),
  );
}
