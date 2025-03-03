import 'package:cosphere/src/features/project/data/models/local/project_hive_model.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';

abstract class ProjectLocalDatasource {
  void addCreatedProjects(List<ProjectApiModel> projects);
  Future<List<ProjectHiveModel>> getCreatedProjects();
  void addAppliedProject(List<ProjectApiModel> projects);
  Future<List<ProjectHiveModel>> getAppliedProjects();
  Future<List<ProjectHiveModel>> getHiringProjects();
  Future<List<ProjectHiveModel>> getCompletedProjects();
  Future<List<ProjectHiveModel>> getActiveProjects();
  void addAssignedTasks(List<ProjectApiModel> projects);
  Future<List<ProjectHiveModel>> getAssignedTasks();
}
