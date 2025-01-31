import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/update_profile_img_req_dto.dart/update_profile_imgage_req_dto.dart';
import 'package:dartz/dartz.dart';

abstract interface class ProfileRepository {
  Future<Either<Failure, String>> updateProfileImage(
      UpdateProfileImgageReqDto dto);
}
