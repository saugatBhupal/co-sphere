import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/models/local/user_hive_model.dart';

extension UserHiveModelExtension on UserHiveModel {
  User toDomain() => User(
        uid: uid!,
        email: email,
        fullname: name,
        dob: dob,
        phone: phone,
        country: country,
        province: province,
        city: city,
        password: password,
        verified: verified,
      );
}

extension UserExtension on User {
  UserHiveModel fromDomain() => UserHiveModel(
        uid: uid,
        email: email,
        name: fullname,
        dob: dob,
        phone: phone,
        country: country,
        province: province,
        city: city,
        password: password,
        verified: verified,
      );
}
