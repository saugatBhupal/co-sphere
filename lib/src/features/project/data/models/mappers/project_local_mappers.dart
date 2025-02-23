import 'package:cosphere/src/features/project/data/models/local/project_hive_model.dart';
import 'package:cosphere/src/features/project/data/models/remote/project_api_model.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';

extension ProjectHiveModelMappers on ProjectHiveModel {
  Project toDomain() => Project.initial().copyWith(
        id: id,
        projectName: projectName,
        position: position,
        address: address,
        companyName: companyName,
        site: site,
        status: status,
        createdAt: createdAt,
      );
}

extension ProjectMappers on Project {
  ProjectHiveModel toDomain() => ProjectHiveModel(
        id: id,
        projectName: projectName,
        position: position,
        address: address,
        companyName: companyName,
        site: site,
        status: status,
        createdAt: createdAt,
      );
}

extension ProjectApiExtension on ProjectApiModel {
  ProjectHiveModel fromApi() => ProjectHiveModel(
        id: id,
        projectName: projectName,
        position: position,
        address: address,
        companyName: companyName,
        site: site,
        status: status,
        createdAt: createdAt,
      );
}
