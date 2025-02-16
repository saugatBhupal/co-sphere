import 'dart:convert';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPref {
  static const _userKey = "User";
  late SharedPreferences _sharedPreferences;

  static Future<void> setUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userJson = user.toJson();
    print("User Pref: $userJson");
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
      final user = User.fromJson(decodedJson);
      return user;
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }
static Future<void> updateUserField({required String key, required dynamic value}) async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final User? currentUser = await getUser();
    if (currentUser == null) {
      print('No user found to update.');
      return;
    }
    Map<String, dynamic> userJson = currentUser.toJson();
    userJson[key] = value;
    final updatedUser = User.fromJson(userJson);
    await prefs.setString(_userKey, jsonEncode(updatedUser));

    print("User field '$key' updated to '$value' in SharedPreferences.");
  } catch (e) {
    print('Error updating user field: $e');
  }
}


  static Future deleteUser() async {
    final _instance = await SharedPreferences.getInstance();
    await _instance.remove(_userKey);
  }

  Future<Either<Failure, bool>> setUserToken(String token) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('token', token);
      return const Right(true);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, String?>> getUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      final token = _sharedPreferences.getString('token');
      return Right(token);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, bool>> deleteUserToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.remove('token');
      return const Right(true);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
