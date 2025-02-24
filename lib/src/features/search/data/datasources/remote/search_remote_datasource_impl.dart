import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/job_api_model.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:cosphere/src/features/search/data/datasources/local/search_local_datasource.dart';
import 'package:cosphere/src/features/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/data/models/search_api_model.dart';
import 'package:dio/dio.dart';

class SearchRemoteDatasourceImpl implements SearchRemoteDatasource {
  final Dio dio;
  final SearchLocalDatasource searchLocalDatasource;
  SearchRemoteDatasourceImpl(
      {required this.dio, required this.searchLocalDatasource});
  @override
  Future<void> addSearchHistory(AddSearchHistoryReqDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.searchHistory, data: dto.toJson());
      if (res.statusCode == 200) {
        return;
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
  Future<List<JobApiModel>> getJobsByName(String query) async {
    try {
      var res = await dio.get("${ApiEndpoints.searchJob}$query");
      if (res.statusCode == 200) {
        print("${res.data} +++");
        return (res.data as List)
            .map((json) => JobApiModel.fromJson(json))
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
  Future<List<ProjectApiModel>> getProjectsByName(String query) async {
    try {
      var res = await dio.get("${ApiEndpoints.searchProject}$query");
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
  Future<List<SearchApiModel>> getSearchHistory(String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.searchHistory}$uid");
      if (res.statusCode == 200) {
        final List<SearchApiModel> searches = (res.data['data'] as List)
            .map((json) => SearchApiModel.fromJson(json))
            .toList();
        if (searches.isNotEmpty) {
          searchLocalDatasource.addSearchHistory(searches);
        }
        return searches;
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
  Future<List<UserApiModel>> getUsersByName(String query) async {
    try {
      var res = await dio.get("${ApiEndpoints.searchUser}$query");
      if (res.statusCode == 200) {
        return (res.data as List)
            .map((json) => UserApiModel.fromJson(json))
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
}
