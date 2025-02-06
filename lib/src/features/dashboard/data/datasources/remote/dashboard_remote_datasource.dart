import 'package:cosphere/src/core/models/remote/user_api_model.dart';

abstract class DashboardRemoteDatasource {
  Future<UserApiModel?> getCurrentUser(String? uid);
}
