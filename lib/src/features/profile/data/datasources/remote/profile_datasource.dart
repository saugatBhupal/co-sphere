import 'package:cosphere/src/features/profile/data/dto/update_profile_img_req_dto.dart/update_profile_imgage_req_dto.dart';

abstract class ProfileDatasource {
  Future<String> updateProfileImage(UpdateProfileImgageReqDto dto);
}
