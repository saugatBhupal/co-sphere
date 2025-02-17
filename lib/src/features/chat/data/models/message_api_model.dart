import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:equatable/equatable.dart';

class MessageApiModel extends Equatable {
  final String id;
  final String content;
  final UserApiModel sender;
  final DateTime sent;

  const MessageApiModel({
    required this.id,
    required this.content,
    required this.sender,
    required this.sent,
  });

  factory MessageApiModel.fromJson(Map<String, dynamic> json) {
    return MessageApiModel(
      id: json['_id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      sender: json['sender'] is Map<String, dynamic>
          ? UserApiModel.fromJson(json['sender'] as Map<String, dynamic>)
          : UserApiModel.fromString(json['sender'] as String),
      sent: DateTime.parse(json['sent'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'sender': sender.toJson(),
      'sent': sent.toIso8601String(),
    };
  }

  @override
  List<Object> get props => [id, content, sender, sent];
}
