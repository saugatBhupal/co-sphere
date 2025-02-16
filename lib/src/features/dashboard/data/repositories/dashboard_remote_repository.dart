import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/mappers/local/user_mappers.dart';
import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/core/network/connectivity_checker.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/local/dashboard_local_datasource.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/remote/dashboard_remote_datasource.dart';
import 'package:cosphere/src/features/dashboard/domain/repositories/dasbboard_repository.dart';
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
    if (await checkInternetConnectivity.isConnected()) {
      try {
        if (userPref != null) {
          UserApiModel? userApiModel =
              await dashboardRemoteDatasource.getCurrentUser(userPref.uid);
          User? user = userApiModel!.toDomain();
          return (Right(userPref));
        } else {
          return const Right(null);
        }
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      if (userPref != null) {
        UserHiveModel? userHiveModel = await dashboardLocalDatasource
            .getCurrentUser(userPref.uid, userPref.email);
        return Right(userHiveModel!.toDomain());
      }
      return const Left(Failure(message: "User not found"));
    }
  }
}
