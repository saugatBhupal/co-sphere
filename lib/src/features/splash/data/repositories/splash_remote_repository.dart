import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/mappers/local/user_mappers.dart';
import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:cosphere/src/core/network/connectivity_checker.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:cosphere/src/features/splash/data/datasources/local/splash_local_datasource.dart';
import 'package:cosphere/src/features/splash/data/datasources/remote/splash_remote_datasource.dart';
import 'package:cosphere/src/features/splash/domain/repositories/splash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashRemoteRepository implements SplashRepository {
  final SplashRemoteDatasource splashRemoteDatasource;
  final SplashLocalDatasource splashLocalDatasource;
  final BaseCheckInternetConnectivity checkInternetConnectivity;

  SplashRemoteRepository({
    required this.splashRemoteDatasource,
    required this.splashLocalDatasource,
    required this.checkInternetConnectivity,
  });
  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    User? userPref = await UserSharedPref.getUser();
    if (await checkInternetConnectivity.isConnected()) {
      try {
        if (userPref != null) {
          UserApiModel? userApiModel =
              await splashRemoteDatasource.getCurrentUser(userPref.uid);

          if (userApiModel != null) {
            User user = userApiModel.toDomain();
            return Right(user);
          }
        }
        return const Left(Failure(message: "User not found"));
      } catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      if (userPref != null) {
        UserHiveModel? userHiveModel = await splashLocalDatasource
            .getCurrentUser(userPref.uid, userPref.email);

        if (userHiveModel != null) {
          return Right(userHiveModel.toDomain());
        }
      }
      return const Left(Failure(message: "User not found"));
    }
  }
}
