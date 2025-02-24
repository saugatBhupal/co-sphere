import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetReviewByIdUsecase implements UsecaseWithParams<Reviews, String> {
  final ProfileRepository profileRepository;

  GetReviewByIdUsecase({required this.profileRepository});

  @override
  Future<Either<Failure, Reviews>> call(String params) {
    return profileRepository.getReviewById(params);
  }
}
