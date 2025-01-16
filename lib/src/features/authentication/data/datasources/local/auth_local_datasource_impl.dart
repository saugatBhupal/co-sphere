import 'package:cosphere/src/core/error/exceptions.dart';
import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:cosphere/src/core/utils/hash_password.dart';
import 'package:cosphere/src/features/authentication/data/datasources/local/auth_local_datasource.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signin_usecase.dart';
import 'package:cosphere/src/features/authentication/domain/usecases/signup_usecase.dart';
import 'package:uuid/uuid.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final HiveService hive;

  AuthLocalDataSourceImpl({required this.hive});

  @override
  Future<UserHiveModel> signIn(SigninParams params) async {
    try {
      String hashedPassword = hashPassword(params.password);
      final user = await hive.getUser(params.email, hashedPassword);
      if (user == null) {
        throw HiveException("Invalid email or password.");
      }
      return user;
    } catch (e) {
      throw HiveException(e.toString());
    }
  }

  @override
  Future<UserHiveModel> signUp(SignupParams params) async {
    try {
      String hashedPassword = hashPassword(params.password);
      UserHiveModel user = UserHiveModel(
        uid: const Uuid().v4(),
        name: params.name,
        email: params.email,
        password: hashedPassword,
        dob: params.dob,
        address: params.address,
        verified: false,
      );
      await hive.addUserToBox(user);
      return user;
    } on Exception {
      throw HiveException();
    }
  }
}
