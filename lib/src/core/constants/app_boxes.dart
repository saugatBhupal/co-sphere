import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/features/project/data/models/local/project_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppBoxesName {
  AppBoxesName._();
  static const String userBox = 'userBox';
  static const String projectBox = 'projectBox';
  static const String createdProjects = 'createdProjects';
  static const String appliedProjects = 'appliedProjects';
}

class AppBoxes {
  AppBoxes._();
  static Box<UserHiveModel> get userBox =>
      Hive.box<UserHiveModel>(AppBoxesName.userBox);
  static Box<ProjectHiveModel> get projectBox =>
      Hive.box<ProjectHiveModel>(AppBoxesName.projectBox);
}

class AppBoxesKeys {
  AppBoxesKeys._();
  static const String user = 'user';
  static const String createdProjects = 'createdProjects';
}
