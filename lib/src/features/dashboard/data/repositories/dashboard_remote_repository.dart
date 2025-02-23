import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/network/connectivity_checker.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/local/dashboard_local_datasource.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/remote/dashboard_remote_datasource.dart';
import 'package:cosphere/src/features/dashboard/domain/repositories/dasbboard_repository.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_local_mappers.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_mappers.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:dartz/dartz.dart';

class DashboardRemoteRepository implements DashboardRepository {
  final DashboardLocalDatasource dashboardLocalDatasource;
  final DashboardRemoteDatasource dashboardRemoteDatasource;
  final BaseCheckInternetConnectivity checkInternetConnectivity;

  DashboardRemoteRepository({
    required this.dashboardRemoteDatasource,
    required this.dashboardLocalDatasource,
    required this.checkInternetConnectivity,
  });
  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    User? userPref = await UserSharedPref.getUser();
    return Right(userPref);
  }

  @override
  Future<Either<Failure, List<Project>>> getProjectsByUser(String uid) async {
    if (await checkInternetConnectivity.isConnected()) {
      try {
        final List<ProjectApiModel> projects =
            await dashboardRemoteDatasource.getProjectsByUser(uid);
        return Right(projects.map((project) => project.toDomain()).toList());
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      final projects = await dashboardLocalDatasource.getCreatedProjects();
      return Right(projects.map((e) => e.toDomain()).toList());
    }
  }
}
