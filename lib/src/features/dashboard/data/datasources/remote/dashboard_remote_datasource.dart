import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';

abstract class DashboardRemoteDatasource {
  Future<UserApiModel?> getCurrentUser(String? uid);
  Future<List<ProjectApiModel>> getProjectsByUser(String uid);
}
