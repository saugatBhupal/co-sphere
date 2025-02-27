import 'package:cosphere/src/core/constants/app_boxes.dart';
import 'package:cosphere/src/features/profile/data/datasources/local/profile_local_datasource.dart';
import 'package:cosphere/src/features/profile/data/models/local/education/education_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/local/experience/experience_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/education_local_mappers.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/experience_local_mapper.dart';
import 'package:cosphere/src/features/profile/data/models/remote/education_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/experience_api_model.dart';
import 'package:cosphere/src/features/project/data/models/local/project_hive_model.dart';
import 'package:cosphere/src/features/project/data/models/mappers/project_local_mappers.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProfileLocalDatasourceImpl implements ProfileLocalDatasource {
  @override
  void addEducation(List<EducationApiModel> education) async {
    await AppBoxes.educationBox.clear();
    List<EducationHiveModel> eduHiveModels =
        education.map((e) => e.fromApi()).toList();
    for (var education in eduHiveModels) {
      await AppBoxes.educationBox.add(education);
    }
  }

  @override
  void addExperience(List<ExperienceApiModel> experience) async {
    await AppBoxes.experienceBox.clear();
    List<ExperienceHiveModel> exHiveModels =
        experience.map((e) => e.fromApi()).toList();
    for (var experience in exHiveModels) {
      await AppBoxes.experienceBox.add(experience);
    }
  }

  @override
  Future<List<EducationHiveModel>> getEducation() async {
    List<EducationHiveModel> storedEducation =
        AppBoxes.educationBox.values.toList();
    return storedEducation;
  }

  @override
  Future<List<ExperienceHiveModel>> getExperience() async {
    List<ExperienceHiveModel> storedExperience =
        AppBoxes.experienceBox.values.toList();
    return storedExperience;
  }

  @override
  void addHistory(List<ProjectApiModel> projects) async {
    var box =
        await Hive.openBox<ProjectHiveModel>(AppBoxesName.historyProjects);
    await box.clear();
    List<ProjectHiveModel> projectHiveModels =
        projects.map((e) => e.fromApi()).toList();
    for (var project in projectHiveModels) {
      await box.add(project);
    }
  }

  @override
  Future<List<ProjectHiveModel>> getHistory() async {
    var box =
        await Hive.openBox<ProjectHiveModel>(AppBoxesName.historyProjects);
    List<ProjectHiveModel> storedProjects = box.values.toList();
    return storedProjects;
  }
}
