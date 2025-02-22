import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/features/project/data/models/tasks_api_model.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';

extension TaskApiModelMappers on TasksApiModel {
  Tasks toDomain() => Tasks.initial().copyWith(
        id: id,
        taskName: taskName,
        taskDescription: taskDescription,
        deadline: deadline,
        status: status,
        createdDate: createdDate,
        completionDate: completionDate,
        completionType: completionType,
        members: members.map((member) => member.toDomain()).toList(),
      );
}

extension TaskMappers on Tasks {
  TasksApiModel fromDomain() => TasksApiModel(
        id: id,
        taskName: taskName,
        taskDescription: taskDescription,
        deadline: deadline,
        status: status,
        createdDate: createdDate,
        completionDate: completionDate,
        completionType: completionType,
        members: members.map((member) => member.toApiModel()).toList(),
      );
}
