import 'package:cosphere/src/core/models/remote/user_api_model.dart';

abstract class SplashRemoteDatasource {
  Future<UserApiModel?> getCurrentUser(String? uid);
}
