import 'package:cosphere/src/features/project/data/models/local/project_hive_model.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';

abstract class DashboardLocalDatasource {
  void addCreatedProjects(List<ProjectApiModel> projects);
Future<List<ProjectHiveModel>> getCreatedProjects();
}
