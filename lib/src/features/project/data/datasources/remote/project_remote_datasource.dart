import 'package:cosphere/src/features/jobs/data/models/applicants_api_model.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/data/models/project_api_model.dart';

abstract interface class ProjectRemoteDatasource {
  Future<List<ProjectApiModel>> getHiringProjectsByUser(String uid);
  Future<List<ProjectApiModel>> getActiveProjectsByUser(String uid);
  Future<List<ProjectApiModel>> getCompletedProjectsByUser(String uid);
  Future<ProjectApiModel> getProjectById(String projectId);
  Future<ApplicantsApiModel> hireUser(HireUserReqDto params);
  Future<ApplicantsApiModel> rejectUser(HireUserReqDto params);
  Future<String> finishHiring(String projectId);
}
