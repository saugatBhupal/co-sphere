import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserProfileByIdUsecase implements UsecaseWithParams {
  final ProfileRepository profileRepository;

  GetUserProfileByIdUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, dynamic>> call(params) {
    return profileRepository.getUserProfileById(params);
  }
}
