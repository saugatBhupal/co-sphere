import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/domain/entities/search.dart';
import 'package:dartz/dartz.dart';

abstract interface class SearchRepository {
  Future<Either<Failure, List<Search>>> getSearchHistory(String uid);
  Future<Either<Failure, void>> addSearchHistory(AddSearchHistoryReqDto dto);
  Future<Either<Failure, List<User>>> getUsersByName(String query);
  Future<Either<Failure, List<Job>>> getJobsByName(String query);
  Future<Either<Failure, List<Project>>> getProjectsByName(String query);
}
