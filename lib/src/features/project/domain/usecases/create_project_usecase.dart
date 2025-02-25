import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class CreateProjectUsecase
    implements UsecaseWithParams<Project, CreateProjectReqDto> {
  final ProjectRepository projectRepository;

  CreateProjectUsecase({required this.projectRepository});

  @override
  Future<Either<Failure, Project>> call(CreateProjectReqDto params) {
    return projectRepository.createProject(params);
  }
}
