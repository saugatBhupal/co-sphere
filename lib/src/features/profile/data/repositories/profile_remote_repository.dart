import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/core/network/connectivity_checker.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:cosphere/src/features/profile/data/datasources/local/profile_local_datasource.dart';
import 'package:cosphere/src/features/profile/data/datasources/remote/profile_datasource.dart';
import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/add_experience_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/get_experience_res_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_res_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/profile_img/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/education_local_mappers.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/experience_local_mapper.dart';
import 'package:cosphere/src/features/profile/data/models/remote/education_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/experience_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/education_mappers.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/experience_mapper.dart';
import 'package:cosphere/src/features/profile/data/models/remote/skill_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/skill_mappers.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/domain/entities/experience.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:dartz/dartz.dart';

class ProfileRemoteRepository implements ProfileRepository {
  final ProfileDatasource profileDatasource;
  final ProfileLocalDatasource profileLocalDatasource;
  final BaseCheckInternetConnectivity checkInternetConnectivity;
  ProfileRemoteRepository({
    required this.profileDatasource,
    required this.checkInternetConnectivity,
    required this.profileLocalDatasource,
  });
  @override
  Future<Either<Failure, String>> updateProfileImage(
      UpdateProfileImgageReqDto dto) async {
    try {
      final String profileImage =
          await profileDatasource.updateProfileImage(dto);
      await UserSharedPref.updateUserField(
          key: 'profileImage', value: profileImage);
      return Right(profileImage);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Skill>>> addSkill(AddSkillsParams params) async {
    try {
      final List<SkillApiModel> skills =
          await profileDatasource.addSkill(params);
      return Right(skills.map((skill) => skill.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Education>>> getEducationByUserID(
      String uid) async {
    User? userPref = await UserSharedPref.getUser();
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final List<EducationApiModel> education =
            await profileDatasource.getEducationByUserID(uid);
        if (userPref!.uid == uid && education.isNotEmpty) {
          profileLocalDatasource.addEducation(education);
        }
        return Right(
            education.map((education) => education.toDomain()).toList());
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      if (userPref!.uid == uid) {
        final educations = await profileLocalDatasource.getEducation();
        return Right(educations.map((e) => e.toDomain()).toList());
      } else {
        return const Left(Failure(message: "User not found locally"));
      }
    }
  }

  @override
  Future<Either<Failure, GetExperienceResDto>> getExperienceByUserID(
      String uid) async {
    User? userPref = await UserSharedPref.getUser();
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final GetExperienceResDto experienceResponseDto =
            await profileDatasource.getExperienceByUserID(uid);
        if (userPref!.uid == uid &&
            experienceResponseDto.experience.isNotEmpty) {
          profileLocalDatasource
              .addExperience(experienceResponseDto.experience);
        }
        return Right(experienceResponseDto);
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      if (userPref!.uid == uid) {
        final experiences = await profileLocalDatasource.getExperience();
        final result = GetExperienceResDto(
          experience:
              experiences.map((e) => e.toDomain().fromDomain()).toList(),
        );
        return Right(result);
      } else {
        return const Left(Failure(message: "User not found locally"));
      }
    }
  }

  @override
  Future<Either<Failure, Education>> addEducation(
      AddEducationReqDto dto) async {
    try {
      final EducationApiModel educationApiModel =
          await profileDatasource.addEducation(dto);
      return Right(educationApiModel.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Experience>> addExperience(
      AddExperienceReqDto dto) async {
    try {
      final ExperienceApiModel experienceApiModel =
          await profileDatasource.addExperience(dto);
      return Right(experienceApiModel.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateIntroResDto>> updateIntro(
      UpdateIntroReqDto dto) async {
    try {
      final UpdateIntroResDto res = await profileDatasource.updateIntro(dto);
      await UserSharedPref.updateUserField(key: 'about', value: res.about);
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getUserProfileById(String uid) async {
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final UserApiModel user =
            await profileDatasource.getUserProfileById(uid);
        return Right(user.toDomain());
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      User? userPref = await UserSharedPref.getUser();
      if (userPref!.uid == uid) {
        print("$userPref is this");
        return Right(userPref);
      } else {
        return const Left(Failure(message: "User not found locally"));
      }
    }
  }
}
