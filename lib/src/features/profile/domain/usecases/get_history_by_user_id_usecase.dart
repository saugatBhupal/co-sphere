import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:dartz/dartz.dart';

class GetHistoryByUserIdUsecase
    implements UsecaseWithParams<List<Project>, String> {
  final ProfileRepository profileRepository;

  GetHistoryByUserIdUsecase({required this.profileRepository});

  @override
  Future<Either<Failure, List<Project>>> call(String params) {
    return profileRepository.getHistoryByUserId(params);
  }
}
