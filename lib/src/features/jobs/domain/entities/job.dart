import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:uuid/uuid.dart';

class Job extends Equatable {
  final String id;
  final String jobName;
  final String position;
  final String address;
  final User postedBy;
  final List<Skill> skills;
  final String companyName;
  final String site;
  final Status status;
  final Salary salary;
  final int likesCount;
  final List<User> likes;
  final List<Applicants> applicants;
  final List<User> hired;
  final DateTime createdAt;

  const Job({
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
  factory Job.initial() {
    return Job(
      id: const Uuid().v4(),
      jobName: '',
      position: '',
      address: '',
      postedBy: User.initial(),
      skills: const [],
      companyName: '',
      site: '',
      status: Status.pending,
      salary: Salary.initial(),
      likesCount: 0,
      likes: const [],
      applicants: const [],
      hired: const [],
      createdAt: DateTime.timestamp(),
    );
  }
  Job copyWith({
    String? id,
    String? jobName,
    String? position,
    String? address,
    User? postedBy,
    List<Skill>? skills,
    String? companyName,
    String? site,
    Status? status,
    Salary? salary,
    int? likesCount,
    List<User>? likes,
    List<Applicants>? applicants,
    List<User>? hired,
    DateTime? createdAt,
  }) {
    return Job(
      id: id ?? this.id,
      jobName: jobName ?? this.jobName,
      position: position ?? this.position,
      address: address ?? this.address,
      postedBy: postedBy ?? this.postedBy,
      skills: skills ?? this.skills,
      companyName: companyName ?? this.companyName,
      site: site ?? this.site,
      status: status ?? this.status,
      salary: salary ?? this.salary,
      likesCount: likesCount ?? this.likesCount,
      likes: likes ?? this.likes,
      applicants: applicants ?? this.applicants,
      hired: hired ?? this.hired,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      jobName,
      position,
      address,
      postedBy,
      skills,
      companyName,
      site,
      status,
      salary,
      likesCount,
      likes,
      applicants,
      hired,
      createdAt,
    ];
  }
}
