import 'package:cosphere/src/core/models/local/user_hive_model.dart';

abstract class SplashLocalDatasource {
  Future<UserHiveModel?> getCurrentUser(String? uid, String? email);
}
