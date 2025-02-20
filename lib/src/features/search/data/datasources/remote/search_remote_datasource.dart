import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/job_api_model.dart';
import 'package:cosphere/src/features/project/data/models/project_api_model.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/data/models/search_api_model.dart';

abstract class SearchRemoteDatasource {
  Future<List<SearchApiModel>> getSearchHistory(String uid);
  Future<void> addSearchHistory(AddSearchHistoryReqDto dto);
  Future<List<UserApiModel>> getUsersByName(String name);
  Future<List<JobApiModel>> getJobsByName(String name);
  Future<List<ProjectApiModel>> getProjectsByName(String name);
}
