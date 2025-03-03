import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';

class ChatScreensArgs {
  final String conversationID;
  final User user;
  final User receipient;

  ChatScreensArgs({
    required this.conversationID,
    required this.user,
    required this.receipient,
  });

  ChatScreensArgs copyWith({
    String? conversationID,
    User? userID,
    User? receipient,
  }) {
    return ChatScreensArgs(
      conversationID: conversationID ?? this.conversationID,
      user: user ?? this.user,
      receipient: receipient ?? this.receipient,
    );
  }
}

class MembersScreensArgs {
  final String projectId;
  final Applicants applicant;

  MembersScreensArgs({required this.projectId, required this.applicant});

  MembersScreensArgs copyWith({
    String? projectId,
    Applicants? applicant,
  }) {
    return MembersScreensArgs(
      projectId: projectId ?? this.projectId,
      applicant: applicant ?? this.applicant,
    );
  }
}

class ActiveScreensArgs {
  final String projectId;
  final String userId;

  ActiveScreensArgs({required this.projectId, required this.userId});

  ActiveScreensArgs copyWith({
    String? projectId,
    String? userId,
  }) {
    return ActiveScreensArgs(
      projectId: projectId ?? this.projectId,
      userId: userId ?? this.userId,
    );
  }
}

class UserJobsScreenArgs {
  final List<Job> jobs;
  final User user;

  UserJobsScreenArgs({required this.jobs, required this.user});

  UserJobsScreenArgs copyWith({
    List<Job>? jobs,
    User? user,
  }) {
    return UserJobsScreenArgs(
      jobs: jobs ?? this.jobs,
      user: user ?? this.user,
    );
  }
}

class ApplicantsScreenArgs {
  final List<Applicants> applicants;
  final String projectId;

  ApplicantsScreenArgs({required this.applicants, required this.projectId});

  ApplicantsScreenArgs copyWith({
    List<Applicants>? applicants,
    String? projectId,
  }) {
    return ApplicantsScreenArgs(
      applicants: applicants ?? this.applicants,
      projectId: projectId ?? this.projectId,
    );
  }
}

class JobScreenArgs {
  final String jobId;
  final String userId;

  JobScreenArgs({required this.jobId, required this.userId});

  JobScreenArgs copyWith({
    String? jobId,
    String? userId,
  }) {
    return JobScreenArgs(
      jobId: jobId ?? this.jobId,
      userId: userId ?? this.userId,
    );
  }
}

class ProjectScreenArgs {
  final String projectId;
  final String userId;

  ProjectScreenArgs({required this.projectId, required this.userId});

  ProjectScreenArgs copyWith({
    String? projectId,
    String? userId,
  }) {
    return ProjectScreenArgs(
      projectId: projectId ?? this.projectId,
      userId: userId ?? this.userId,
    );
  }
}

class AssignedTaskScreenArgs {
  final List<Project> projects;
  final User user;

  AssignedTaskScreenArgs({required this.projects, required this.user});

  AssignedTaskScreenArgs copyWith({
    List<Project>? projects,
    User? user,
  }) {
    return AssignedTaskScreenArgs(
      projects: projects ?? this.projects,
      user: user ?? this.user,
    );
  }
}
