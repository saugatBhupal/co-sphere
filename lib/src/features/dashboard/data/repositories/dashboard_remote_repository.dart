import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/remote/dashboard_remote_datasource.dart';
import 'package:cosphere/src/features/dashboard/domain/repositories/dasbboard_repository.dart';
import 'package:dartz/dartz.dart';

class DashboardRemoteRepository implements DashboardRepository {
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  DashboardRemoteRepository({
    required this.dashboardRemoteDatasource,
  });
  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    User? userPref = await UserSharedPref.getUser();
    return Right(userPref);
  }
}
