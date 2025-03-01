import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class  HireUserUsecase implements UsecaseWithParams<Applicants, HireUserReqDto> {
  final ProjectRepository projectRepository;

  HireUserUsecase({required this.projectRepository});

  @override
  Future<Either<Failure, Applicants>> call(HireUserReqDto params) {
    return projectRepository.hireUser(params);
  }
}
