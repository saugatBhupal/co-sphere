import 'package:cosphere/src/core/constants/app_boxes.dart';
import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}cosphere.db';

    Hive.init(path);
    Hive.registerAdapter(UserHiveModelAdapter());
    await Hive.openBox<UserHiveModel>(AppBoxesName.userBox);
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
