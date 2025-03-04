import 'package:cosphere/src/core/constants/app_boxes.dart';
import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/core/type_adaptar/status_adaptar.dart';
import 'package:cosphere/src/features/jobs/data/models/local/job_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/local/education/education_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/local/experience/experience_hive_model.dart';
import 'package:cosphere/src/features/project/data/models/local/project_hive_model.dart';
import 'package:cosphere/src/features/search/data/models/search_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}cosphere.db';

    Hive.init(path);
    Hive.registerAdapter(UserHiveModelAdapter());
    Hive.registerAdapter(ProjectHiveModelAdapter());
    Hive.registerAdapter(JobHiveModelAdapter());
    Hive.registerAdapter(StatusAdapter());
    Hive.registerAdapter(SearchHiveModelAdapter());
    Hive.registerAdapter(ExperienceHiveModelAdapter());
    Hive.registerAdapter(EducationHiveModelAdapter());
    await Hive.openBox<UserHiveModel>(AppBoxesName.userBox);
    await Hive.openBox<ProjectHiveModel>(AppBoxesName.projectBox);
    await Hive.openBox<JobHiveModel>(AppBoxesName.jobBox);
    await Hive.openBox<SearchHiveModel>(AppBoxesName.searchBox);
    await Hive.openBox<ExperienceHiveModel>(AppBoxesName.experienceBox);
    await Hive.openBox<EducationHiveModel>(AppBoxesName.educationBox);
  }

  Future<void> addUserToBox(UserHiveModel user) async {
    var box = await Hive.openBox<UserHiveModel>(AppBoxesName.userBox);
    await box.put(user.uid, user);
  }

  Future<UserHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<UserHiveModel>(AppBoxesName.userBox);
    var user = box.values.firstWhere(
        (element) => element.email == email && element.password == password);
    box.close();
    return user;
  }

  Future<UserHiveModel?> getUser(String email, String uid) async {
    var box = await Hive.openBox<UserHiveModel>(AppBoxesName.userBox);
    var user = box.values
        .firstWhere((element) => element.email == email && element.uid == uid);
    box.close();
    return user;
  }

  Future<void> deleteUserFromBox(String userID) async {
    try {
      var box = await Hive.openBox<UserHiveModel>(AppBoxesName.userBox);
      await box.delete(userID);
      await box.close();
    } catch (e) {
      print("Error deleting user: $e");
    }
  }
}
