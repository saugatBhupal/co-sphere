import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/datasources/remote/profile_datasource.dart';
import 'package:cosphere/src/features/profile/data/dto/update_profile_img_req_dto.dart/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/data/models/education_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/education_mappers.dart';
import 'package:cosphere/src/features/profile/data/models/skill_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/skill_mappers.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:dartz/dartz.dart';

class ProfileRemoteRepository implements ProfileRepository {
  final ProfileDatasource profileDatasource;

  ProfileRemoteRepository({required this.profileDatasource});
  @override
  Future<Either<Failure, String>> updateProfileImage(
      UpdateProfileImgageReqDto dto) async {
    try {
      final String profileImage =
          await profileDatasource.updateProfileImage(dto);
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
    try {
      final List<EducationApiModel> education =
          await profileDatasource.getEducationByUserID(uid);
      return Right(education.map((education) => education.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
