import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/education/add_education_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class AddEducationUsecase
    implements UsecaseWithParams<Education, AddEducationReqDto> {
  final ProfileRepository profileRepository;

  AddEducationUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, Education>> call(AddEducationReqDto params) {
    return profileRepository.addEducation(params);
  }
}
