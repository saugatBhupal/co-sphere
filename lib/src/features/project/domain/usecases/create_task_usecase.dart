import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/data/dto/create_task/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class CreateTaskUsecase implements UsecaseWithParams<Tasks, CreateTaskReqDto> {
  final ProjectRepository projectRepository;

  CreateTaskUsecase({required this.projectRepository});

  @override
  Future<Either<Failure, Tasks>> call(CreateTaskReqDto params) {
    return projectRepository.createTask(params);
  }
}
