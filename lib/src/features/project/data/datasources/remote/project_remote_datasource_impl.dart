import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/features/jobs/data/models/applicants_api_model.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/data/models/project_api_model.dart';
import 'package:dio/dio.dart';

class ProjectRemoteDatasourceImpl implements ProjectRemoteDatasource {
  final Dio dio;

  ProjectRemoteDatasourceImpl({required this.dio});

  @override
  Future<String> finishHiring(String projectId) async {
    try {
      var res = await dio.post("${ApiEndpoints.finishHire}$projectId");
      print("Response Data: ${res}");
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
}
