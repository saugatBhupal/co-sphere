import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/applicants_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/reviews_api_model.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/dto/add_review/add_review_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/apply_project/apply_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/complete_project/complete_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_project/create_project_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/create_task/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:cosphere/src/features/project/data/models/remote/tasks_api_model.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';
import 'package:dio/dio.dart';

class ProjectRemoteDatasourceImpl implements ProjectRemoteDatasource {
  final Dio dio;
  ProjectRemoteDatasourceImpl({required this.dio});

  @override
  Future<String> finishHiring(String projectId) async {
    try {
      var res = await dio.post("${ApiEndpoints.finishHire}$projectId");
      if (res.statusCode == 200) {
        return res.data['message'];
      } else {
        throw Failure(
          message: res.data['message'],
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      print("Dio Exception: ${e.response?.statusCode} ${e.response?.data}");
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ProjectApiModel>> getActiveProjectsByUser(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getActive}$uid");
      if (res.statusCode == 200) {
        return (res.data as List)
            .map((json) => ProjectApiModel.fromJson(json))
            .toList();
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ProjectApiModel>> getCompletedProjectsByUser(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getCompleted}$uid");
      if (res.statusCode == 200) {
        return (res.data as List)
            .map((json) => ProjectApiModel.fromJson(json))
            .toList();
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ProjectApiModel>> getHiringProjectsByUser(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getHiring}$uid");
      if (res.statusCode == 200) {
        return (res.data as List)
            .map((json) => ProjectApiModel.fromJson(json))
            .toList();
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<ApplicantsApiModel> hireUser(HireUserReqDto params) async {
    try {
      var res = await dio.post(ApiEndpoints.hire, data: params.toJson());
      if (res.statusCode == 200) {
        return ApplicantsApiModel.fromJson(res.data['applicant']);
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<ApplicantsApiModel> rejectUser(HireUserReqDto params) async {
    try {
      var res = await dio.post(ApiEndpoints.reject, data: params.toJson());
      if (res.statusCode == 200) {
        return ApplicantsApiModel.fromJson(res.data['applicant']);
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<ProjectApiModel> getProjectById(String projectId) async {
    try {
      var res = await dio.get("${ApiEndpoints.projectById}$projectId");
      if (res.statusCode == 200) {
        return ProjectApiModel.fromJson(res.data);
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<TasksApiModel> completeTask(CompleteTaskParams params) async {
    try {
      var res = await dio.post(
        "${ApiEndpoints.project}${params.projectId}/task/${params.taskId}",
      );
      if (res.statusCode == 200) {
        List<TasksApiModel> tasks = (res.data['task'] as List)
            .map((json) => TasksApiModel.fromJson(json))
            .toList();
        return tasks[0];
      } else {
        throw Failure(
          message: res.statusMessage ?? "Unknown error",
          statusCode: res.statusCode?.toString() ?? "Unknown",
        );
      }
    } on DioException catch (e) {
      print("Dio Exception: ${e.response?.statusCode} ${e.response?.data}");
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<TasksApiModel> createTask(CreateTaskReqDto dto) async {
    try {
      var res = await dio.post("${ApiEndpoints.project}${dto.projectId}/task",
          data: dto.toJson());
      if (res.statusCode == 200) {
        List<TasksApiModel> tasks = (res.data['task'] as List)
            .map((json) => TasksApiModel.fromJson(json))
            .toList();
        return tasks[0];
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ProjectApiModel>> getProjectsByUser(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getProjectUser}$uid");
      if (res.statusCode == 200) {
        final List<ProjectApiModel> projects = (res.data as List<dynamic>)
            .map((json) =>
                ProjectApiModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return projects;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ProjectApiModel>> getAppliedProjects(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getAppliedProject}$uid");
      if (res.statusCode == 200) {
        final List<ProjectApiModel> projects = (res.data as List<dynamic>)
            .map((json) =>
                ProjectApiModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return projects;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ReviewsApiModel>> addReview(AddReviewReqDto dto) async {
    try {
      var res = await dio.post("${ApiEndpoints.addReviews}${dto.projectId}",
          data: dto.toJson());
      if (res.statusCode == 200) {
        return (res.data['reviews'] as List)
            .map((json) => ReviewsApiModel.fromJson(json))
            .toList();
      } else {
        throw Failure(
          message: res.data['message'],
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      print("Dio Exception: ${e.response?.statusCode} ${e.response?.data}");
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<String> completeProject(CompleteProjectReqDto dto) async {
    try {
      var res = await dio.post(
          "${ApiEndpoints.project}${dto.projectId}/complete",
          data: dto.toJson());
      if (res.statusCode == 200) {
        return res.data['message'];
      } else {
        throw Failure(
          message: res.data['message'],
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      print("Dio Exception: ${e.response?.statusCode} ${e.response?.data}");
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<ReviewsApiModel> getReviewById(String reviewId) async {
    try {
      var res = await dio.get("${ApiEndpoints.review}/$reviewId");
      if (res.statusCode == 200) {
        return ReviewsApiModel.fromJson(res.data);
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<ProjectApiModel> createProject(CreateProjectReqDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.project, data: dto.toJson());
      if (res.statusCode == 200) {
        return ProjectApiModel.fromJson(res.data);
      } else {
        throw Failure(
          message: res.data['message'],
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      print("Dio Exception: ${e.response?.statusCode} ${e.response?.data}");
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ProjectApiModel>> getExploreProjects(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.getExploreProjects}$uid");
      if (res.statusCode == 200) {
        final List<ProjectApiModel> projects = (res.data as List<dynamic>)
            .map((json) =>
                ProjectApiModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return projects;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<ProjectApiModel> applyToProject(ApplyProjectReqDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.applyToProject, data: dto.toJson());
      if (res.statusCode == 200) {
        return ProjectApiModel.fromJson(res.data['project']);
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<List<ProjectApiModel>> getActiveTasksByUserId(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.user}$uid/task");
      if (res.statusCode == 200) {
        final List<ProjectApiModel> projects = (res.data as List<dynamic>)
            .map((json) =>
                ProjectApiModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return projects;
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      print("Dio Exception: ${e.response?.statusCode} ${e.response?.data}");
      return await handleErrorResponse(e);
    }
  }
}
