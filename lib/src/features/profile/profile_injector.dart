import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/profile/data/datasources/remote/profile_datasource.dart';
import 'package:cosphere/src/features/profile/data/datasources/remote/profile_datasource_impl.dart';
import 'package:cosphere/src/features/profile/data/repositories/profile_remote_repository.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_profile_image_usecase.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';

void initProfile() {
  sl.registerLazySingleton<ProfileDatasource>(
      () => ProfileDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRemoteRepository(profileDatasource: sl()));
  sl.registerLazySingleton<UpdateProfileImageUsecase>(
      () => UpdateProfileImageUsecase(profileRepository: sl()));
  sl.registerFactory<ProfileBloc>(
      () => ProfileBloc(updateProfileImageUsecase: sl()));
}
