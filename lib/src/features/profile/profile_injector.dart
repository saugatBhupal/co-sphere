import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/profile/data/datasources/remote/profile_datasource.dart';
import 'package:cosphere/src/features/profile/data/datasources/remote/profile_datasource_impl.dart';
import 'package:cosphere/src/features/profile/data/repositories/profile_remote_repository.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_education_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_experience_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_education_by_userID_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_experience_by_userID_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_user_profile_by_id_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_intro_usecase.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_profile_image_usecase.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';

void initProfile() {
  sl.registerLazySingleton<ProfileDatasource>(
      () => ProfileDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRemoteRepository(
      profileDatasource: sl(), checkInternetConnectivity: sl()));
  sl.registerLazySingleton<UpdateProfileImageUsecase>(
      () => UpdateProfileImageUsecase(profileRepository: sl()));
  sl.registerLazySingleton<AddSkillUsecase>(
      () => AddSkillUsecase(profileRepository: sl()));
  sl.registerLazySingleton<GetEducationByUserIDUsecase>(
      () => GetEducationByUserIDUsecase(profileRepository: sl()));
  sl.registerLazySingleton<GetExperienceByUserIDUsecase>(
      () => GetExperienceByUserIDUsecase(profileRepository: sl()));
  sl.registerLazySingleton<AddEducationUsecase>(
      () => AddEducationUsecase(profileRepository: sl()));
  sl.registerLazySingleton<AddExperienceUsecase>(
      () => AddExperienceUsecase(profileRepository: sl()));
  sl.registerLazySingleton<UpdateIntroUsecase>(
      () => UpdateIntroUsecase(profileRepository: sl()));
  sl.registerLazySingleton<GetUserProfileByIdUsecase>(
      () => GetUserProfileByIdUsecase(profileRepository: sl()));
  sl.registerFactory<ProfileBloc>(() => ProfileBloc(
      updateProfileImageUsecase: sl(),
      addSkillUsecase: sl(),
      getEducationByUseridUsecase: sl(),
      getExperienceByUserIDUsecase: sl(),
      addEducationUsecase: sl(),
      addExperienceUsecase: sl(),
      updateIntroUsecase: sl(),
      getUserProfileByIdUsecase: sl()));
}
