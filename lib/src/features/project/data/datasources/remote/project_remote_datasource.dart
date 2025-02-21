import 'package:cosphere/src/features/project/data/models/project_api_model.dart';

abstract interface class ProjectRemoteDatasource {
  Future<List<ProjectApiModel>> getHiringProjectsByUser(String uid);
  Future<List<ProjectApiModel>> getActiveProjectsByUser(String uid);
  Future<List<ProjectApiModel>> getCompletedProjectsByUser(String uid);
  Future<ProjectApiModel> getProjectById(String projectId);
  Future<String> hireUser(List<String> uid);
  Future<String> rejectUser(List<String> uid);
  Future<String> finishHiring(String uid);
}
