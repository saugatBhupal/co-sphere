import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/data/models/applicants_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/mappers/job_mappers.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/dto/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_mappers.dart';
import 'package:cosphere/src/features/project/data/models/mappers/task_mappers.dart';
import 'package:cosphere/src/features/project/data/models/project_api_model.dart';
import 'package:cosphere/src/features/project/data/models/tasks_api_model.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';
import 'package:dartz/dartz.dart';

class ProjectRemoteRepository implements ProjectRepository {
  final ProjectRemoteDatasource datasource;

  ProjectRemoteRepository({required this.datasource});

  @override
  Future<Either<Failure, String>> finishHiring(String projectId) async {
    try {
      return Right(await datasource.finishHiring(projectId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getActiveProjectsByUser(
      String uid) async {
    try {
      final List<ProjectApiModel> projects =
          await datasource.getActiveProjectsByUser(uid);
      return Right(projects.map((project) => project.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getCompletedProjectsByUser(
      String uid) async {
    try {
      final List<ProjectApiModel> projects =
          await datasource.getCompletedProjectsByUser(uid);
      return Right(projects.map((project) => project.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getHiringProjectsByUser(
      String uid) async {
    try {
      final List<ProjectApiModel> projects =
          await datasource.getHiringProjectsByUser(uid);
      return Right(projects.map((project) => project.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Applicants>> hireUser(HireUserReqDto params) async {
    try {
      final ApplicantsApiModel applicants = await datasource.hireUser(params);
      return Right(applicants.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Applicants>> rejectUser(HireUserReqDto params) async {
    try {
      final ApplicantsApiModel applicants = await datasource.rejectUser(params);
      return Right(applicants.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Project>> getProjectById(String projectId) async {
    try {
      final ProjectApiModel project =
          await datasource.getProjectById(projectId);
      return Right(project.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tasks>> completeTask(CompleteTaskParams params) async {
    try {
      final TasksApiModel task = await datasource.completeTask(params);
      return Right(task.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tasks>> createTask(CreateTaskReqDto dto) async {
    try {
      final TasksApiModel task = await datasource.createTask(dto);
      return Right(task.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
