import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/data/dto/apply_project/apply_project_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class ApplyToProjectUsecase
    implements UsecaseWithParams<Project, ApplyProjectReqDto> {
  final ProjectRepository projectRepository;

  ApplyToProjectUsecase({required this.projectRepository});

  @override
  Future<Either<Failure, Project>> call(ApplyProjectReqDto params) {
    return projectRepository.applyToProject(params);
  }
}
