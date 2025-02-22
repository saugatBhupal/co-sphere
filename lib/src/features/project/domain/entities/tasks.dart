import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';

class Tasks extends Equatable {
  final String id;
  final String taskName;
  final String taskDescription;
  final DateTime deadline;
  final Status status;
  final DateTime createdDate;
  final DateTime completionDate;
  final CompletionType completionType;
  final List<User> members;

  const Tasks({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    required this.deadline,
    required this.status,
    required this.createdDate,
    required this.completionDate,
    required this.completionType,
    required this.members,
  });

  factory Tasks.initial() {
    return Tasks(
      id: const Uuid().v4(),
      taskName: '',
      taskDescription: '',
      deadline: DateTime.timestamp(),
      status: Status.active,
      createdDate: DateTime.timestamp(),
      completionDate: DateTime.timestamp(),
      completionType: CompletionType.ontime,
      members: const [],
    );
  }

  Tasks copyWith({
    String? id,
    String? taskName,
    String? taskDescription,
    DateTime? deadline,
    Status? status,
    DateTime? createdDate,
    DateTime? completionDate,
    CompletionType? completionType,
    List<User>? members,
  }) {
    return Tasks(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      taskDescription: taskDescription ?? this.taskDescription,
      deadline: deadline ?? this.deadline,
      status: status ?? this.status,
      createdDate: createdDate ?? this.createdDate,
      completionDate: completionDate ?? this.completionDate,
      completionType: completionType ?? this.completionType,
      members: members ?? this.members,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      taskName,
      taskDescription,
      deadline,
      status,
      createdDate,
      completionDate,
      completionType,
      members,
    ];
  }
}
