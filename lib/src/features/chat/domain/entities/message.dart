import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';

class Message extends Equatable {
  final String id;
  final String content;
  final User sender;
  final DateTime sent;

  const Message({
    required this.id,
    required this.content,
    required this.sender,
    required this.sent,
  });

  factory Message.initial() {
    return Message(
      id: '',
      content: '',
      sender: User.initial(),
      sent: DateTime.now(),
    );
  }

  Message copyWith({
    String? id,
    String? content,
    User? user,
    DateTime? sent,
  }) {
    return Message(
      id: id ?? this.id,
      content: content ?? this.content,
      sender: sender,
      sent: sent ?? this.sent,
    );
  }

  @override
  List<Object> get props => [id, content, sender, sent];
}
