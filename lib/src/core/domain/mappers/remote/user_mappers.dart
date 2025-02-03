import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';

extension UserApiModelExtension on UserApiModel {
  User toDomain() => User.initial().copyWith(
        uid: uid,
        email: email,
        fullname: fullname,
        dob: dob,
        phone: phone,
        country: country,
        province: province,
        city: city,
        password: password,
        verified: verified,
        profileImage: profileImage,
      );
}

extension UserExtension on User {
  UserApiModel toApiModel() => UserApiModel(
        uid: uid,
        email: email,
        fullname: fullname,
        dob: dob,
        phone: phone,
        country: country,
        province: province,
        city: city,
        password: password,
        verified: verified,
        profileImage: profileImage,
      );
}
