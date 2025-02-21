import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_mappers.dart';
import 'package:cosphere/src/features/project/data/models/project_api_model.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:dartz/dartz.dart';

class ProjectRemoteRepository implements ProjectRepository {
  final ProjectRemoteDatasource datasource;

  ProjectRemoteRepository({required this.datasource});

  @override
  Future<Either<Failure, String>> finishHiring(String params) {
    // TODO: implement finishHiring
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Project>>> getActiveProjectsByUser(
      String uid) async {
    try {
      final List<ProjectApiModel> projects =
          await datasource.getActiveProjectsByUser(uid);
      return Right(projects.map((project) => project.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getCompletedProjectsByUser(
      String uid) async {
    try {
      final List<ProjectApiModel> projects =
          await datasource.getCompletedProjectsByUser(uid);
      return Right(projects.map((project) => project.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getHiringProjectsByUser(
      String uid) async {
    try {
      final List<ProjectApiModel> projects =
          await datasource.getHiringProjectsByUser(uid);
      return Right(projects.map((project) => project.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> hireUser(List<String> params) {
    // TODO: implement hireUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> rejectUser(List<String> params) {
    // TODO: implement rejectUser
    throw UnimplementedError();
  }
}
