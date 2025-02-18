import 'package:cosphere/src/core/domain/entities/user.dart';

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
