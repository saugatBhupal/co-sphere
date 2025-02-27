import 'package:cosphere/src/core/constants/app_boxes.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/features/project/data/datasources/local/project_local_datasource.dart';
import 'package:cosphere/src/features/project/data/models/local/project_hive_model.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_local_mappers.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProjectLocalDatasourceImpl implements ProjectLocalDatasource {
  ProjectLocalDatasourceImpl();

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

  @override
  void addAppliedProject(List<ProjectApiModel> projects) async {
    var box =
        await Hive.openBox<ProjectHiveModel>(AppBoxesName.appliedProjects);
    await box.clear();
    List<ProjectHiveModel> projectHiveModels =
        projects.map((e) => e.fromApi()).toList();
    for (var project in projectHiveModels) {
      await box.add(project);
    }
  }

  @override
  Future<List<ProjectHiveModel>> getAppliedProjects() async {
    var box =
        await Hive.openBox<ProjectHiveModel>(AppBoxesName.appliedProjects);
    List<ProjectHiveModel> storedProjects = box.values.toList();
    return storedProjects;
  }

  @override
  Future<List<ProjectHiveModel>> getActiveProjects() async {
    var box =
        await Hive.openBox<ProjectHiveModel>(AppBoxesName.appliedProjects);
    List<ProjectHiveModel> storedProjects = box.values.toList();
    storedProjects = storedProjects
        .where((project) => project.status == Status.pending)
        .toList();
    return storedProjects;
  }

  @override
  Future<List<ProjectHiveModel>> getCompletedProjects() async {
    var box =
        await Hive.openBox<ProjectHiveModel>(AppBoxesName.appliedProjects);
    List<ProjectHiveModel> storedProjects = box.values.toList();
    storedProjects = storedProjects
        .where((project) => project.status == Status.completed)
        .toList();
    return storedProjects;
  }

  @override
  Future<List<ProjectHiveModel>> getHiringProjects() async {
    var box =
        await Hive.openBox<ProjectHiveModel>(AppBoxesName.appliedProjects);
    List<ProjectHiveModel> storedProjects = box.values.toList();
    storedProjects = storedProjects
        .where((project) => project.status == Status.pending)
        .toList();
    return storedProjects;
  }
}
