import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/network/connectivity_checker.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/applicants_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/mappers/job_mappers.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/review_mapper.dart';
import 'package:cosphere/src/features/profile/data/models/remote/reviews_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/project/data/datasources/local/project_local_datasource.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/dto/add_review/add_review_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/apply_project/apply_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/complete_project/complete_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_task/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_local_mappers.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_mappers.dart';
import 'package:cosphere/src/features/project/data/models/mappers/task_mappers.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:cosphere/src/features/project/data/models/remote/tasks_api_model.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';
import 'package:dartz/dartz.dart';

class ProjectRemoteRepository implements ProjectRepository {
  final ProjectRemoteDatasource datasource;
  final ProjectLocalDatasource projectLocalDatasource;
  final BaseCheckInternetConnectivity checkInternetConnectivity;

  ProjectRemoteRepository({
    required this.datasource,
    required this.projectLocalDatasource,
    required this.checkInternetConnectivity,
  });

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
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final List<ProjectApiModel> projects =
            await datasource.getActiveProjectsByUser(uid);
        return Right(projects.map((project) => project.toDomain()).toList());
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      final projects = await projectLocalDatasource.getHiringProjects();
      return Right(projects.map((e) => e.toDomain()).toList());
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getCompletedProjectsByUser(
      String uid) async {
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final List<ProjectApiModel> projects =
            await datasource.getCompletedProjectsByUser(uid);
        return Right(projects.map((project) => project.toDomain()).toList());
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      final projects = await projectLocalDatasource.getCompletedProjects();
      return Right(projects.map((e) => e.toDomain()).toList());
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getHiringProjectsByUser(
      String uid) async {
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final List<ProjectApiModel> projects =
            await datasource.getHiringProjectsByUser(uid);
        return Right(projects.map((project) => project.toDomain()).toList());
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      final projects = await projectLocalDatasource.getHiringProjects();
      return Right(projects.map((e) => e.toDomain()).toList());
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

  @override
  Future<Either<Failure, List<Project>>> getProjectsByUser(String uid) async {
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final List<ProjectApiModel> projects =
            await datasource.getProjectsByUser(uid);
        if (projects.isNotEmpty) {
          projectLocalDatasource.addCreatedProjects(projects);
        }
        return Right(projects.map((project) => project.toDomain()).toList());
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      final projects = await projectLocalDatasource.getCreatedProjects();
      return Right(projects.map((e) => e.toDomain()).toList());
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getAppliedProjects(String uid) async {
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final List<ProjectApiModel> projects =
            await datasource.getAppliedProjects(uid);
        if (projects.isNotEmpty) {
          projectLocalDatasource.addAppliedProject(projects);
        }
        return Right(projects.map((project) => project.toDomain()).toList());
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      final projects = await projectLocalDatasource.getAppliedProjects();
      return Right(projects.map((e) => e.toDomain()).toList());
    }
  }

  @override
  Future<Either<Failure, List<Reviews>>> addReview(AddReviewReqDto dto) async {
    try {
      final List<ReviewsApiModel> reviews = await datasource.addReview(dto);
      return Right(reviews.map((review) => review.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> completeProject(
      CompleteProjectReqDto dto) async {
    try {
      return Right(await datasource.completeProject(dto));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Reviews>> getReviewById(String reviewId) async {
    try {
      final ReviewsApiModel review = await datasource.getReviewById(reviewId);
      return Right(review.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Project>> createProject(
      CreateProjectReqDto dto) async {
    try {
      final ProjectApiModel project = await datasource.createProject(dto);
      return Right(project.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getExploreProjects(String uid) async {
    try {
      final List<ProjectApiModel> projects =
          await datasource.getExploreProjects(uid);
      return Right(projects.map((project) => project.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Project>> applyToProject(
      ApplyProjectReqDto dto) async {
    try {
      final ProjectApiModel project = await datasource.applyToProject(dto);
      return Right(project.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
