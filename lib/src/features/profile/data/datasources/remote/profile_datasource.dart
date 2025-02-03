import 'package:cosphere/src/features/profile/data/dto/update_profile_img_req_dto.dart/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/data/models/skill_api_model.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';

abstract class ProfileDatasource {
  Future<String> updateProfileImage(UpdateProfileImgageReqDto dto);
  Future<List<SkillApiModel>> addSkill(AddSkillsParams params);
}
