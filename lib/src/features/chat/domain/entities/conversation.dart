import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';

class Conversation extends Equatable {
  final String id;
  final List<User> members;
  final List<Message> messages;

  const Conversation({
    required this.id,
    required this.members,
    required this.messages,
  });

  factory Conversation.initial() {
    return const Conversation(
      id: '',
      members: [],
      messages: [],
    );
  }

  Conversation copyWith({
    String? id,
    List<User>? members,
    List<Message>? messages,
  }) {
    return Conversation(
      id: id ?? this.id,
      members: members ?? this.members,
      messages: messages ?? this.messages,
    );
  }

  @override
  List<Object> get props => [id, members, messages];
}
