import 'package:cosphere/src/features/profile/data/models/remote/education_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';

extension EducationApiModelExtension on EducationApiModel {
  Education toDomain() => Education(
        id: id,
        organization: organization,
        degree: degree,
        from: from,
        to: to,
      );
}

extension EducationExtension on Education {
  EducationApiModel fromDomain() => EducationApiModel(
        id: id,
        organization: organization,
        degree: degree,
        from: from,
        to: to,
      );
}
