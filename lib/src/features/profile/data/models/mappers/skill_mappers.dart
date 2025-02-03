import 'package:cosphere/src/features/profile/data/models/skill_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';

extension SkillApiModelExtension on SkillApiModel {
  Skill toDomain() => Skill.initial().copyWith(uid: uid, name: name);
}

extension SkillExtension on Skill {
  SkillApiModel fromDomain() => SkillApiModel(uid: uid, name: name);
}
