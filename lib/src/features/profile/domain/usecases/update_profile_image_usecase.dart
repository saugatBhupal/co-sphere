import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/profile_img/update_profile_imgage_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileImageUsecase
    implements UsecaseWithParams<String, UpdateProfileImgageReqDto> {
  final ProfileRepository profileRepository;

  UpdateProfileImageUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, String>> call(UpdateProfileImgageReqDto params) {
    return profileRepository.updateProfileImage(params);
  }
}
