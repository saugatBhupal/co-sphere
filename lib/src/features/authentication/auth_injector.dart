import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/authentication/data/datasources/local/auth_local_datasource.dart';
import 'package:cosphere/src/features/authentication/data/datasources/local/auth_local_datasource_impl.dart';
import 'package:cosphere/src/features/authentication/data/repositories/auth_local_repository.dart';
import 'package:cosphere/src/features/authentication/domain/repositories/auth_repository.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/signin/sign_in_bloc.dart';

void initAuth() {
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(hive: sl()));
  sl.registerLazySingleton<AuthRepository>(
      () => AuthLocalRepository(authLocalDataSource: sl()));
  sl.registerLazySingleton<SignupUsecase>(
      () => SignupUsecase(authRepository: sl()));
  sl.registerLazySingleton<SigninUsecase>(
      () => SigninUsecase(authRepository: sl()));
  sl.registerFactory<SignUpBloc>(() => SignUpBloc(signupUsecase: sl()));
  sl.registerFactory<SignInBloc>(() => SignInBloc(signinUsecase: sl()));
}
