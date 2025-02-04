import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/get_experience_res_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/profile_img/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/data/models/education_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/skill_api_model.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';

abstract class ProfileDatasource {
  Future<String> updateProfileImage(UpdateProfileImgageReqDto dto);
  Future<List<SkillApiModel>> addSkill(AddSkillsParams params);
  Future<List<EducationApiModel>> getEducationByUserID(String uid);
  Future<GetExperienceResDto> getExperienceByUserID(String uid);
  Future<EducationApiModel> addEducation(AddEducationReqDto dto);
}
