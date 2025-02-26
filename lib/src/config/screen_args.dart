import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';

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
