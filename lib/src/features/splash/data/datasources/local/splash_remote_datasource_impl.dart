import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:cosphere/src/features/splash/data/datasources/local/splash_local_datasource.dart';

class SplashLocalDatasourceImpl implements SplashLocalDatasource {
  final HiveService hiveService;

  SplashLocalDatasourceImpl({required this.hiveService});

  @override
  Future<UserHiveModel?> getCurrentUser(String? uid, String? email) async {
    return await hiveService.login(email!, uid!);
  }
}
