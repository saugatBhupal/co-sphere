import 'package:cosphere/src/core/constants/app_boxes.dart';
import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/local/dashboard_local_datasource.dart';
import 'package:cosphere/src/features/project/data/models/local/project_hive_model.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_local_mappers.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DashboardLocalDatasourceImpl implements DashboardLocalDatasource {
  final HiveService hiveService;

  DashboardLocalDatasourceImpl({required this.hiveService});

  @override
  void addCreatedProjects(List<ProjectApiModel> projects) async {
    var box =
        await Hive.openBox<ProjectHiveModel>(AppBoxesName.createdProjects);
    await box.clear();
    List<ProjectHiveModel> projectHiveModels =
        projects.map((e) => e.fromApi()).toList();
    for (var project in projectHiveModels) {
      await box.add(project);
    }
  }

  @override
  Future<List<ProjectHiveModel>> getCreatedProjects() async {
    var box =
        await Hive.openBox<ProjectHiveModel>(AppBoxesName.createdProjects);
    List<ProjectHiveModel> storedProjects = box.values.toList();
    return storedProjects;
  }
}
