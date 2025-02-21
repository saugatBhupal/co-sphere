import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:dartz/dartz.dart';

abstract interface class ProjectRepository {
  Future<Either<Failure, List<Project>>> getHiringProjectsByUser(String uid);
  Future<Either<Failure, List<Project>>> getActiveProjectsByUser(String uid);
  Future<Either<Failure, List<Project>>> getCompletedProjectsByUser(String uid);
  Future<Either<Failure, Project>> getProjectById(String projectId);
  Future<Either<Failure, String>> hireUser(List<String> params);
  Future<Either<Failure, String>> rejectUser(List<String> params);
  Future<Either<Failure, String>> finishHiring(String params);
}
