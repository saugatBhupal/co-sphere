import 'dart:convert';

import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPref {
  static const _userKey = "User";

  static Future<void> setUser(UserApiModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userJson = user.toJson();
    print("User: $userJson");
    await prefs.setString(_userKey, jsonEncode(userJson));
  }

  static Future<User?> getUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? res = prefs.getString(_userKey);
      if (res == null) {
        return null;
      }
      final Map<String, dynamic> decodedJson = json.decode(res);
      UserApiModel userApiModel = UserApiModel.fromJson(decodedJson);
      final user = userApiModel.toDomain();
      return user;
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  static Future deleteUser() async {
    final _instance = await SharedPreferences.getInstance();
    await _instance.remove(_userKey);
  }
}
