import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/mappers/job_mappers.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/applicants_api_model.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/skill_mappers.dart';
import 'package:cosphere/src/features/profile/data/models/remote/reviews_api_model.dart';
import 'package:cosphere/src/features/profile/data/models/remote/skill_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/project/data/models/remote/tasks_api_model.dart';
import 'package:cosphere/src/features/project/domain/entities/durations.dart';

class ProjectApiModel {
  final String id;
  final String projectName;
  final String position;
  final String address;
  final UserApiModel postedBy;
  final List<SkillApiModel> skills;
  final String companyName;
  final String site;
  final String description;
  final Status status;
  final Salary salary;
  final DurationTime duration;
  final int likesCount;
  final List<UserApiModel> likes;
  final List<ApplicantsApiModel> acceptedApplicants;
  final List<ApplicantsApiModel> rejectedApplicants;
  final List<ApplicantsApiModel> pendingApplicants;
  final List<TasksApiModel> tasks;
  final List<UserApiModel> members;
  final List<ReviewsApiModel> reviews;
  final CompletionType completionType;
  final DateTime createdAt;
  final DateTime completionDate;

  const ProjectApiModel({
    required this.id,
    required this.projectName,
    required this.position,
    required this.address,
    required this.postedBy,
    required this.skills,
    required this.companyName,
    required this.site,
    required this.description,
    required this.status,
    required this.salary,
    required this.duration,
    required this.likesCount,
    required this.likes,
    required this.acceptedApplicants,
    required this.rejectedApplicants,
    required this.pendingApplicants,
    required this.members,
    required this.tasks,
    required this.reviews,
    required this.completionType,
    required this.createdAt,
    required this.completionDate,
  });

  factory ProjectApiModel.fromJson(Map<String, dynamic> json) {
    return ProjectApiModel(
      id: json['_id'] as String? ?? '',
      projectName: json['projectName'] as String? ?? '',
      position: json['position'] as String? ?? '',
      address: json['address'] as String? ?? '',
      postedBy: json['postedBy'] is Map<String, dynamic>
          ? UserApiModel.fromJson(json['postedBy'] as Map<String, dynamic>)
          : UserApiModel.initial().copyWith(uid: json['postedBy']),
      skills: (json['skills'] as List?)
              ?.map((skill) => skill is Map<String, dynamic>
                  ? SkillApiModel.fromJson(skill)
                  : Skill.initial().copyWith(uid: skill).fromDomain())
              .toList() ??
          [],
      companyName: json['companyName'] as String? ?? '',
      site: json['site'] as String? ?? '',
      description: json['description'] as String? ?? '',
      status: StatusExtension.fromDatabaseValue(json["status"] ?? "Active"),
      salary: json['salary'] != null && json['salary'] is Map<String, dynamic>
          ? Salary.fromJson(json['salary'] as Map<String, dynamic>)
          : Salary.initial(),
      duration:
          json['duration'] != null && json['duration'] is Map<String, dynamic>
              ? DurationTime.fromJson(json['duration'] as Map<String, dynamic>)
              : DurationTime.initial(),
      likesCount: json['likesCount'] as int? ?? 0,
      likes: json['likes'] != null && json['likes'] is List
          ? (json['likes'] as List)
              .map((like) => like is Map<String, dynamic>
                  ? UserApiModel.fromJson(like)
                  : UserApiModel.initial().copyWith(uid: like.toString()))
              .toList()
          : [],
      acceptedApplicants: (json['acceptedApplicants'] as List?)
              ?.whereType<Map<String, dynamic>>()
              .map((app) => ApplicantsApiModel.fromJson(app))
              .toList() ??
          [],
      rejectedApplicants: (json['rejectedApplicants'] as List?)
              ?.whereType<Map<String, dynamic>>()
              .map((app) => ApplicantsApiModel.fromJson(app))
              .toList() ??
          [],
      pendingApplicants: (json['pendingApplicants'] as List?)
              ?.whereType<Map<String, dynamic>>()
              .map((app) => ApplicantsApiModel.fromJson(app))
              .toList() ??
          [],
      // tasks: (json['tasks'] as List?)
      //         ?.map((task) =>
      //             TasksApiModel.fromJson(task as Map<String, dynamic>))
      //         .toList() ??
      //     [],
      tasks: json['tasks'] == null
          ? []
          : (json['tasks'] is List)
              ? (json['tasks'] as List)
                  .map((task) =>
                      TasksApiModel.fromJson(task as Map<String, dynamic>))
                  .toList()
              : [TasksApiModel.fromJson(json['tasks'] as Map<String, dynamic>)],
      members: json['members'] != null && json['members'] is List
          ? (json['members'] as List)
              .map((member) => member is Map<String, dynamic>
                  ? UserApiModel.fromJson(member)
                  : UserApiModel.initial().copyWith(uid: member.toString()))
              .toList()
          : [],
      reviews: (json['reviews'] as List?)
              ?.map((review) => ReviewsApiModel.initial().copyWith(id: review))
              .toList() ??
          [],
      completionType: CompletionExtension.fromDatabaseValue(
          json["completionType"] ?? "On-Time"),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime(1970, 1, 1),
      completionDate: json['completionDate'] != null
          ? DateTime.parse(json['completionDate'])
          : DateTime(1970, 1, 1),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'projectName': projectName,
      'position': position,
      'address': address,
      'postedBy': postedBy.toJson(),
      'skills': skills.map((skill) => skill.toJson()).toList(),
      'companyName': companyName,
      'site': site,
      'status': status.toDatabaseValue(),
      'salary': salary.toJson(),
      'duration': duration.toJson(),
      'likesCount': likesCount,
      'likes': likes.map((like) => like.toJson()).toList(),
      'acceptedApplicants':
          acceptedApplicants.map((applicant) => applicant.toJson()).toList(),
      'rejectedApplicants':
          rejectedApplicants.map((applicant) => applicant.toJson()).toList(),
      'pendingApplicants':
          pendingApplicants.map((applicant) => applicant.toJson()).toList(),
      'members': members.map((member) => member.toJson()).toList(),
      'completionType': completionType.toDatabaseValue(),
      'createdAt': createdAt.toIso8601String(),
      'completionDate': completionDate.toIso8601String(),
    };
  }
}
