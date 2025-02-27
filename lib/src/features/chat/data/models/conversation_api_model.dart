import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/features/chat/data/models/message_api_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ConversationApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final List<UserApiModel> members;
  final List<MessageApiModel>? messages;

  const ConversationApiModel({
    required this.id,
    required this.members,
    this.messages,
  });

  factory ConversationApiModel.fromJson(Map<String, dynamic> json) {
    return ConversationApiModel(
      id: json['_id'] as String,
      members: (json['members'] as List<dynamic>).map((member) {
        return member is Map<String, dynamic>
            ? UserApiModel.fromJson(member)
            : UserApiModel.initial().copyWith(uid: member);
      }).toList(),
      messages: json['messages'] is List<dynamic>
          ? (json['messages'] as List<dynamic>)
              .map((message) =>
                  MessageApiModel.fromJson(message as Map<String, dynamic>))
              .toList()
          : (json['messages'] is Map<String, dynamic>
              ? [
                  MessageApiModel.fromJson(
                      json['messages'] as Map<String, dynamic>)
                ]
              : []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'members': members.map((member) => member.toJson()).toList(),
      'messages': messages!.map((message) => message.toJson()).toList(),
    };
  }

  @override
  List<Object> get props => [id, members];
}
