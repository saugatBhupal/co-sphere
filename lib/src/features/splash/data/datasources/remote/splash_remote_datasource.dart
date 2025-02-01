import 'package:cosphere/src/core/models/remote/UserApiModel.dart';

abstract class SplashRemoteDatasource {
  Future<UserApiModel?> getCurrentUser(String? uid);
}
