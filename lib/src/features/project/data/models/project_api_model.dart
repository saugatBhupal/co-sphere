import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/applicants_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/mappers/status_enum_mapper.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/profile/data/models/skill_api_model.dart';
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
  final Status status;
  final Salary salary;
  final Durations duration;
  final int likesCount;
  final List<UserApiModel> likes;
  final List<ApplicantsApiModel> applicants;
  final List<UserApiModel> members;
  final DateTime createdAt;

  const ProjectApiModel({
    required this.id,
    required this.projectName,
    required this.position,
    required this.address,
    required this.postedBy,
    required this.skills,
    required this.companyName,
    required this.site,
    required this.status,
    required this.salary,
    required this.duration,
    required this.likesCount,
    required this.likes,
    required this.applicants,
    required this.members,
    required this.createdAt,
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
      skills: (json['skills'] as List<dynamic>)
          .map((message) =>
              SkillApiModel.fromJson(message as Map<String, dynamic>))
          .toList(),
      companyName: json['companyName'] as String? ?? '',
      site: json['site'] as String? ?? '',
      status: StatusExtension.fromDatabaseValue(json["status"]),
      salary: Salary.fromJson(json['salary']),
      duration: Durations.fromJson(json['duration']),
      likesCount: json['likesCount'] as int? ?? 0,
      likes: json['likes'] is List?
          ? (json['likes'] as List<Map<String, dynamic>>)
              .map((like) => UserApiModel.fromJson(like))
              .toList()
          : (json['likes'] as List<String>)
              .map((like) => UserApiModel.initial().copyWith(uid: like))
              .toList(),
      applicants: (json['applicants'] as List<Map<String, dynamic>>)
          .map((like) => ApplicantsApiModel.fromJson(like))
          .toList(),
      members: json['members'] is List?
          ? (json['members'] as List<Map<String, dynamic>>)
              .map((member) => UserApiModel.fromJson(member))
              .toList()
          : (json['members'] as List<String>)
              .map((member) => UserApiModel.initial().copyWith(uid: member))
              .toList(),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
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
      'applicants': applicants.map((applicant) => applicant.toJson()).toList(),
      'members': members.map((member) => member.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
