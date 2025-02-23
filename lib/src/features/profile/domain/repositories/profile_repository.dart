import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/add_experience_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/get_experience_res_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_res_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/profile_img/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/domain/entities/experience.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:dartz/dartz.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, String>> updateProfileImage(
      UpdateProfileImgageReqDto dto);
  Future<Either<Failure, List<Skill>>> addSkill(AddSkillsParams params);
  Future<Either<Failure, List<Education>>> getEducationByUserID(String uid);
  Future<Either<Failure, GetExperienceResDto>> getExperienceByUserID(
      String uid);
  Future<Either<Failure, Education>> addEducation(AddEducationReqDto dto);
  Future<Either<Failure, Experience>> addExperience(AddExperienceReqDto dto);
  Future<Either<Failure, UpdateIntroResDto>> updateIntro(UpdateIntroReqDto dto);
  Future<Either<Failure, User>> getUserProfileById(String uid);
}
