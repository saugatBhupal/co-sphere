import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AppBoxesName {
  AppBoxesName._();
  static const String userBox = 'userBox';
}

class AppBoxes {
  AppBoxes._();
  static Box<UserHiveModel> get userBox =>
      Hive.box<UserHiveModel>(AppBoxesName.userBox);
}

class AppBoxesKeys {
  AppBoxesKeys._();
  static const String user = 'user';
}
