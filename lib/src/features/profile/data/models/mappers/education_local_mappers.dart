import 'package:cosphere/src/features/profile/data/models/local/education/education_hive_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/education_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';

extension EducationHiveModelMappers on EducationHiveModel {
  Education toDomain() => Education.initial().copywith(
        id: id,
        organization: organization,
        degree: degree,
        from: from,
        to: to,
      );
}

extension EducationMappers on Education {
  EducationHiveModel toDomain() => EducationHiveModel(
        id: id,
        organization: organization,
        degree: degree,
        from: from,
        to: to,
      );
}

extension EducationApiExtension on EducationApiModel {
  EducationHiveModel fromApi() => EducationHiveModel(
        id: id,
        organization: organization,
        degree: degree,
        from: from,
        to: to,
      );
}
