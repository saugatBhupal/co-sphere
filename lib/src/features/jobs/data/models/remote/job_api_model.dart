import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/jobs/data/models/remote/applicants_api_model.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/skill_mappers.dart';
import 'package:cosphere/src/features/profile/data/models/remote/skill_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';

class JobApiModel {
  final String id;
  final String jobName;
  final String position;
  final String address;
  final UserApiModel postedBy;
  final List<SkillApiModel> skills;
  final String companyName;
  final String site;
  final Status status;
  final Salary salary;
  final int likesCount;
  final List<UserApiModel> likes;
  final List<ApplicantsApiModel> applicants;
  final List<UserApiModel> hired;
  final DateTime createdAt;

  const JobApiModel({
    required this.id,
    required this.jobName,
    required this.position,
    required this.address,
    required this.postedBy,
    required this.skills,
    required this.companyName,
    required this.site,
    required this.status,
    required this.salary,
    required this.likesCount,
    required this.likes,
    required this.applicants,
    required this.hired,
    required this.createdAt,
  });

  factory JobApiModel.fromJson(Map<String, dynamic> json) {
    return JobApiModel(
      id: json['_id'] as String? ?? '',
      jobName: json['jobName'] as String? ?? '',
      position: json['position'] as String? ?? '',
      address: json['address'] as String? ?? '',
      postedBy:
          json['postedBy'] != null && json['postedBy'] is Map<String, dynamic>
              ? UserApiModel.fromJson(json['postedBy'] as Map<String, dynamic>)
              : UserApiModel.initial()
                  .copyWith(uid: json['postedBy'] as String? ?? ''),
      skills: (json['skills'] as List?)
              ?.map((skill) => skill is Map<String, dynamic>
                  ? SkillApiModel.fromJson(skill)
                  : Skill.initial().copyWith(uid: skill).fromDomain())
              .toList() ??
          [],
      companyName: json['companyName'] as String? ?? '',
      site: json['site'] as String? ?? '',
      status:
          StatusExtension.fromDatabaseValue(json['status'] as String? ?? ''),
      salary: json['salary'] != null && json['salary'] is Map<String, dynamic>
          ? Salary.fromJson(json['salary'] as Map<String, dynamic>)
          : Salary.initial(),
      likesCount: json['likes_count'] as int? ?? 0,
      likes: json['likes'] != null && json['likes'] is List
          ? (json['likes'] as List)
              .map((like) => like is Map<String, dynamic>
                  ? UserApiModel.fromJson(like)
                  : UserApiModel.initial().copyWith(uid: like.toString()))
              .toList()
          : [],
      applicants: (json['applicants'] as List?)
              ?.whereType<Map<String, dynamic>>()
              .map((app) => ApplicantsApiModel.fromJson(app))
              .toList() ??
          [],
      hired: json['hired'] != null && json['hired'] is List
          ? (json['hired'] as List)
              .map((hired) => hired is Map<String, dynamic>
                  ? UserApiModel.fromJson(hired)
                  : UserApiModel.initial().copyWith(uid: hired.toString()))
              .toList()
          : [],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'].toString()) ??
              DateTime(1970, 1, 1)
          : DateTime(1970, 1, 1),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'jobName': jobName,
      'position': position,
      'address': address,
      'postedBy': postedBy.toJson(),
      'skills': skills.map((skill) => skill.toJson()).toList(),
      'companyName': companyName,
      'site': site,
      'status': status.toDatabaseValue(),
      'salary': salary.toJson(),
      'likesCount': likesCount,
      'likes': likes.map((like) => like.toJson()).toList(),
      'applicants': applicants.map((applicant) => applicant.toJson()).toList(),
      'hired': hired.map((hiredUser) => hiredUser.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
