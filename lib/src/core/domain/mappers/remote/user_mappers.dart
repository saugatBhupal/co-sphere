import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';

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
        skills: skills
            ?.map((skill) =>
                Skill.initial().copyWith(uid: skill.uid, name: skill.name))
            .toList(),
        about: about,
        overview: overview,
        createdAt: createdAt,
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
        about: about,
        overview: overview,
        createdAt: createdAt,
      );
}
