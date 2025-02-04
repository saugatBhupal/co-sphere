import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/get_experience_response_dto/get_experience_response_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/update_profile_img_req_dto.dart/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:dartz/dartz.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, String>> updateProfileImage(
      UpdateProfileImgageReqDto dto);
  Future<Either<Failure, List<Skill>>> addSkill(AddSkillsParams params);
  Future<Either<Failure, List<Education>>> getEducationByUserID(String uid);
  Future<Either<Failure, GetExperienceResponseDto>> getExperienceByUserID(
      String uid);
}
