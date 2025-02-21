import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class GetProjectByIdUsecase implements UsecaseWithParams<Project, String> {
  final ProjectRepository projectRepository;

  GetProjectByIdUsecase({required this.projectRepository});

  @override
  Future<Either<Failure, Project>> call(String params) {
    return projectRepository.getProjectById(params);
  }
}
