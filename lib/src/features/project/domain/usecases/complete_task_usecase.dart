import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';

class CompleteTaskUsecase
    implements UsecaseWithParams<Tasks, CompleteTaskParams> {
  final ProjectRepository projectRepository;

  CompleteTaskUsecase({required this.projectRepository});

  @override
  Future<Either<Failure, Tasks>> call(CompleteTaskParams params) {
    return projectRepository.completeTask(params);
  }
}

class CompleteTaskParams extends Equatable {
  final String projectId;
  final String taskId;

  const CompleteTaskParams({required this.projectId, required this.taskId});

  @override
  List<Object> get props => [projectId, taskId];
}
