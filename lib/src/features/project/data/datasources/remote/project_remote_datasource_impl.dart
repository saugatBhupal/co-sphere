import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/applicants_api_model.dart';
import 'package:cosphere/src/features/project/data/datasources/local/project_local_datasource.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/dto/create_task_req_dto.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:cosphere/src/features/project/data/models/remote/tasks_api_model.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';
import 'package:dio/dio.dart';

class ProjectRemoteDatasourceImpl implements ProjectRemoteDatasource {
  final Dio dio;
  final ProjectLocalDatasource projectLocalDatasource;
  ProjectRemoteDatasourceImpl(
      {required this.dio, required this.projectLocalDatasource});

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
        return tasks.firstWhere(
          (task) => task.id == params.taskId,
          orElse: () => throw Failure(
            message: "Task with ID ${params.taskId} not found",
            statusCode: res.statusCode?.toString() ?? "Unknown",
          ),
        );
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
        if (projects.isNotEmpty) {
          projectLocalDatasource.addCreatedProjects(projects);
        }
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
        print(projects);
        if (projects.isNotEmpty) {
          projectLocalDatasource.addAppliedProject(projects);
        }
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
}
