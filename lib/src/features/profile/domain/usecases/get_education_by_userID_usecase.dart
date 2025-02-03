import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetEducationByUseridUsecase
    implements UsecaseWithParams<List<Education>, String> {
  final ProfileRepository profileRepository;

  GetEducationByUseridUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, List<Education>>> call(String params) {
    return profileRepository.getEducationByUserID(params);
  }
}
