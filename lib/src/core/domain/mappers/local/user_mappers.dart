import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/models/local/user_hive_model.dart';

extension UserHiveModelExtension on UserHiveModel {
  User toDomain() => User(
        uid: uid!,
        email: email,
        name: name,
        dob: dob,
        address: address,
        password: password,
        verified: verified,
      );
}

extension UserExtension on User {
  UserHiveModel fromDomain() => UserHiveModel(
        uid: uid,
        email: email,
        name: name,
        dob: dob,
        address: address,
        password: password,
        verified: verified,
      );
}
