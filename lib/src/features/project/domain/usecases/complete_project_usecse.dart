import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/data/dto/complete_project/complete_project_req_dto.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class CompleteProjectUsecse
    implements UsecaseWithParams<String, CompleteProjectReqDto> {
  final ProjectRepository projectRepository;

  CompleteProjectUsecse({required this.projectRepository});

  @override
  Future<Either<Failure, String>> call(CompleteProjectReqDto params) {
    return projectRepository.completeProject(params);
  }
}
