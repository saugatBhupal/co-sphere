import 'package:cosphere/src/features/jobs/data/models/remote/applicants_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/reviews_api_model.dart';
import 'package:cosphere/src/features/project/data/dto/add_review/add_review_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/apply_project/apply_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/complete_project/complete_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_task/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:cosphere/src/features/project/data/models/remote/tasks_api_model.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';

abstract interface class ProjectRemoteDatasource {
  Future<List<ProjectApiModel>> getHiringProjectsByUser(String uid);
  Future<List<ProjectApiModel>> getActiveProjectsByUser(String uid);
  Future<List<ProjectApiModel>> getCompletedProjectsByUser(String uid);
  Future<ProjectApiModel> getProjectById(String projectId);
  Future<ApplicantsApiModel> hireUser(HireUserReqDto params);
  Future<ApplicantsApiModel> rejectUser(HireUserReqDto params);
  Future<String> finishHiring(String projectId);
  Future<TasksApiModel> completeTask(CompleteTaskParams params);
  Future<TasksApiModel> createTask(CreateTaskReqDto dto);
  Future<List<ProjectApiModel>> getProjectsByUser(String uid);
  Future<List<ProjectApiModel>> getAppliedProjects(String uid);
  Future<List<ReviewsApiModel>> addReview(AddReviewReqDto dto);
  Future<String> completeProject(CompleteProjectReqDto dto);
  Future<ReviewsApiModel> getReviewById(String reviewId);
  Future<ProjectApiModel> createProject(CreateProjectReqDto dto);
  Future<List<ProjectApiModel>> getExploreProjects(String uid);
  Future<ProjectApiModel> applyToProject(ApplyProjectReqDto dto);
}
