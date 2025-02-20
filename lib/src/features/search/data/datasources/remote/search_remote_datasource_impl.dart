import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/job_api_model.dart';
import 'package:cosphere/src/features/project/data/models/project_api_model.dart';
import 'package:cosphere/src/features/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/data/models/search_api_model.dart';
import 'package:dio/dio.dart';

class SearchRemoteDatasourceImpl implements SearchRemoteDatasource {
  final Dio dio;

  SearchRemoteDatasourceImpl({required this.dio});
  @override
  Future<void> addSearchHistory(AddSearchHistoryReqDto dto) {
    // TODO: implement addSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<List<JobApiModel>> getJobsByName(String name) {
    // TODO: implement getJobsByName
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectApiModel>> getProjectsByName(String name) {
    // TODO: implement getProjectsByName
    throw UnimplementedError();
  }

  @override
  Future<List<SearchApiModel>> getSearchHistory(String uid) {
    // TODO: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<List<UserApiModel>> getUsersByName(String name) {
    // TODO: implement getUsersByName
    throw UnimplementedError();
  }
}
