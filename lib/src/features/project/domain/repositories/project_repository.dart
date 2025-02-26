import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/project/data/dto/add_review/add_review_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/complete_project/complete_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_task/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';
import 'package:dartz/dartz.dart';

abstract interface class ProjectRepository {
  Future<Either<Failure, List<Project>>> getHiringProjectsByUser(String uid);
  Future<Either<Failure, List<Project>>> getActiveProjectsByUser(String uid);
  Future<Either<Failure, List<Project>>> getCompletedProjectsByUser(String uid);
  Future<Either<Failure, Project>> getProjectById(String projectId);
  Future<Either<Failure, Applicants>> hireUser(HireUserReqDto params);
  Future<Either<Failure, Applicants>> rejectUser(HireUserReqDto params);
  Future<Either<Failure, String>> finishHiring(String projectId);
  Future<Either<Failure, Tasks>> completeTask(CompleteTaskParams params);
  Future<Either<Failure, Tasks>> createTask(CreateTaskReqDto dto);
  Future<Either<Failure, List<Project>>> getProjectsByUser(String uid);
  Future<Either<Failure, List<Project>>> getAppliedProjects(String uid);
  Future<Either<Failure, List<Reviews>>> addReview(AddReviewReqDto dto);
  Future<Either<Failure, String>> completeProject(CompleteProjectReqDto dto);
  Future<Either<Failure, Reviews>> getReviewById(String reviewId);
  Future<Either<Failure, Project>> createProject(CreateProjectReqDto dto);
  Future<Either<Failure, List<Project>>> getExploreProjects(String uid);
}
