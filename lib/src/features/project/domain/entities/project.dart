import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/project/domain/entities/durations.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:uuid/uuid.dart';

class Project extends Equatable {
  final String id;
  final String projectName;
  final String position;
  final String address;
  final User postedBy;
  final List<Skill> skills;
  final String companyName;
  final String site;
  final String description;
  final Status status;
  final Salary salary;
  final int likesCount;
  final DurationTime duration;
  final List<User> likes;
  final List<Applicants> acceptedApplicants;
  final List<Applicants> rejectedApplicants;
  final List<Applicants> pendingApplicants;
  final List<Tasks> tasks;
  final List<User> members;
  final List<Reviews> reviews;
  final CompletionType completionType;
  final DateTime createdAt;
  final DateTime completionDate;

  const Project({
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
    required this.tasks,
    required this.members,
    required this.reviews,
    required this.completionType,
    required this.createdAt,
    required this.completionDate,
  });
  factory Project.initial() {
    return Project(
      id: const Uuid().v4(),
      projectName: '',
      position: '',
      address: '',
      postedBy: User.initial(),
      skills: const [],
      companyName: '',
      site: '',
      description: '',
      status: Status.pending,
      salary: Salary.initial(),
      duration: DurationTime.initial(),
      likesCount: 0,
      likes: const [],
      acceptedApplicants: const [],
      rejectedApplicants: const [],
      pendingApplicants: const [],
      tasks: const [],
      members: const [],
      reviews: const [],
      completionType: CompletionType.ontime,
      createdAt: DateTime.timestamp(),
      completionDate: DateTime.timestamp(),
    );
  }
  Project copyWith({
    String? id,
    String? projectName,
    String? position,
    String? address,
    User? postedBy,
    List<Skill>? skills,
    String? companyName,
    String? site,
    String? description,
    Status? status,
    Salary? salary,
    DurationTime? duration,
    int? likesCount,
    List<User>? likes,
    List<Applicants>? acceptedApplicants,
    List<Applicants>? rejectedApplicants,
    List<Applicants>? pendingApplicants,
    List<Applicants>? applicants,
    List<User>? members,
    List<Tasks>? tasks,
    List<Reviews>? reviews,
    CompletionType? completionType,
    DateTime? createdAt,
    DateTime? completionDate,
  }) {
    return Project(
      id: id ?? this.id,
      projectName: projectName ?? this.projectName,
      position: position ?? this.position,
      address: address ?? this.address,
      postedBy: postedBy ?? this.postedBy,
      skills: skills ?? this.skills,
      companyName: companyName ?? this.companyName,
      site: site ?? this.site,
      description: description ?? this.description,
      status: status ?? this.status,
      salary: salary ?? this.salary,
      duration: duration ?? this.duration,
      likesCount: likesCount ?? this.likesCount,
      likes: likes ?? this.likes,
      acceptedApplicants: acceptedApplicants ?? this.acceptedApplicants,
      rejectedApplicants: rejectedApplicants ?? this.rejectedApplicants,
      pendingApplicants: pendingApplicants ?? this.pendingApplicants,
      tasks: tasks ?? this.tasks,
      members: members ?? this.members,
      reviews: reviews ?? this.reviews,
      completionType: completionType ?? this.completionType,
      createdAt: createdAt ?? this.createdAt,
      completionDate: completionDate ?? this.completionDate,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      projectName,
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
      acceptedApplicants,
      members,
      tasks,
      createdAt,
    ];
  }
}
