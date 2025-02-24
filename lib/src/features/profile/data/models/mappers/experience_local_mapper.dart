import 'package:cosphere/src/features/profile/data/models/local/experience/experience_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/experience_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/experience.dart';

extension ExperienceHiveModelMappers on ExperienceHiveModel {
  Experience toDomain() => Experience.initial().copywith(
        id: id,
        position: position,
        organization: organization,
        status: status,
        from: from,
        to: to,
      );
}

extension ExperienceMappers on Experience {
  ExperienceHiveModel toDomain() => ExperienceHiveModel(
        id: id,
        position: position,
        organization: organization,
        status: status,
        from: from,
        to: to,
      );
}

extension ExperienceApiExtension on ExperienceApiModel {
  ExperienceHiveModel fromApi() => ExperienceHiveModel(
        id: id,
        position: position,
        organization: organization,
        status: status,
        from: from,
        to: to,
      );
}
