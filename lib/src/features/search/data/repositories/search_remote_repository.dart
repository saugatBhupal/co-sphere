import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/job_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/mappers/job_mappers.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_mappers.dart';
import 'package:cosphere/src/features/project/data/models/project_api_model.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/data/models/mappers/search_mappers.dart';
import 'package:cosphere/src/features/search/data/models/search_api_model.dart';
import 'package:cosphere/src/features/search/domain/entities/search.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRemoteRepository implements SearchRepository {
  final SearchRemoteDatasource datasource;

  SearchRemoteRepository({required this.datasource});
  @override
  Future<Either<Failure, void>> addSearchHistory(
      AddSearchHistoryReqDto dto) async {
    try {
      await datasource.addSearchHistory(dto);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Job>>> getJobsByName(String query) async {
    try {
      final List<JobApiModel> jobs = await datasource.getJobsByName(query);
      return Right(jobs.map((job) => job.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getProjectsByName(String query) async {
    try {
      final List<ProjectApiModel> projects =
          await datasource.getProjectsByName(query);
      return Right(projects.map((project) => project.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Search>>> getSearchHistory(String uid) async {
    try {
      final List<SearchApiModel> searches =
          await datasource.getSearchHistory(uid);
      return Right(searches.map((search) => search.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsersByName(String query) async {
    try {
      final List<UserApiModel> users = await datasource.getUsersByName(query);
      return Right(users.map((user) => user.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
