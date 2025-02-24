import 'package:cosphere/src/features/profile/data/models/remote/experience_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/experience.dart';

extension ExperienceApiModelExtension on ExperienceApiModel {
  Experience toDomain() => Experience(
        id: id,
        position: position,
        organization: organization,
        status: status,
        from: from,
        to: to,
      );
}

extension ExperienceExtension on Experience {
  ExperienceApiModel fromDomain() => ExperienceApiModel(
        id: id,
        position: position,
        organization: organization,
        status: status,
        from: from,
        to: to,
      );
}
