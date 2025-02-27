import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/local/education/education_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/local/experience/experience_hive_model.dart';
import 'package:cosphere/src/features/project/data/models/local/project_hive_model.dart';
import 'package:cosphere/src/features/search/data/models/search_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppBoxesName {
  AppBoxesName._();
  static const String userBox = 'userBox';
  static const String projectBox = 'projectBox';
  static const String jobBox = 'jobBox';
  static const String searchBox = 'searchBox';
  static const String experienceBox = 'experienceBox';
  static const String educationBox = 'educationBox';
  static const String createdProjects = 'createdProjects';
  static const String appliedProjects = 'appliedProjects';
  static const String historyProjects = 'historyProjects';
  static const String appliedJobs = 'appliedJobs';
  static const String createdJobs = 'createdJobs';
  static const String searchHistory = 'searchHistory';
}

class AppBoxes {
  AppBoxes._();
  static Box<UserHiveModel> get userBox =>
      Hive.box<UserHiveModel>(AppBoxesName.userBox);
  static Box<ProjectHiveModel> get projectBox =>
      Hive.box<ProjectHiveModel>(AppBoxesName.projectBox);
  static Box<ProjectHiveModel> get jobBox =>
      Hive.box<ProjectHiveModel>(AppBoxesName.jobBox);
  static Box<SearchHiveModel> get searchBox =>
      Hive.box<SearchHiveModel>(AppBoxesName.searchBox);
  static Box<ExperienceHiveModel> get experienceBox =>
      Hive.box<ExperienceHiveModel>(AppBoxesName.experienceBox);
  static Box<EducationHiveModel> get educationBox =>
      Hive.box<EducationHiveModel>(AppBoxesName.educationBox);
}

class AppBoxesKeys {
  AppBoxesKeys._();
  static const String user = 'user';
  static const String createdProjects = 'createdProjects';
}
