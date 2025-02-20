import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/domain/entities/search.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRemoteRepository implements SearchRepository {
  final SearchRemoteDatasource datasource;

  SearchRemoteRepository({required this.datasource});
  @override
  Future<Either<Failure, void>> addSearchHistory(AddSearchHistoryReqDto dto) {
    // TODO: implement addSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Job>>> getJobsByName(String name) {
    // TODO: implement getJobsByName
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Project>>> getProjectsByName(String name) {
    // TODO: implement getProjectsByName
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Search>>> getSearchHistory(String uid) {
    // TODO: implement getSearchHistory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<User>>> getUsersByName(String name) {
    // TODO: implement getUsersByName
    throw UnimplementedError();
  }
}
