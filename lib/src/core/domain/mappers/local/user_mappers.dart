import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/models/local/user_hive_model.dart';
import 'package:cosphere/src/core/models/remote/UserApiModel.dart';

extension UserHiveModelExtension on UserHiveModel {
  User toDomain() => User(
        uid: uid!,
        email: email,
        fullname: name,
        dob: dob!,
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
        password: password ?? "",
        verified: verified,
      );
}

extension UserHiveExtension on UserHiveModel {
  UserApiModel toApi() => UserApiModel(
        uid: uid!,
        email: email,
        fullname: name,
        dob: dob!,
        phone: phone,
        country: country,
        province: province,
        city: city,
        password: password,
        verified: verified,
      );
}

extension UserApiExtension on UserApiModel {
  UserHiveModel fromApi() => UserHiveModel(
        uid: uid,
        email: email,
        name: fullname,
        dob: dob,
        phone: phone,
        country: country,
        province: province,
        city: city,
        password: password ?? "",
        verified: verified,
      );
}
