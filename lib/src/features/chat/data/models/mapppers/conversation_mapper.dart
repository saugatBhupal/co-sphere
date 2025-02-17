import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/features/chat/data/models/conversation_api_model.dart';
import 'package:cosphere/src/features/chat/data/models/mapppers/message_mappers.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';

extension ConversationApiModelExtension on ConversationApiModel {
  Conversation toDomain() => Conversation.initial().copyWith(
        id: id,
        members: members.map((member) => member.toDomain()).toList(),
        messages: messages.map((message) => message.toDomain()).toList(),
      );
}

extension ConversationExtension on Conversation {
  ConversationApiModel fromDomain() => ConversationApiModel(
        id: id,
        members: members.map((member) => member.toApiModel()).toList(),
        messages: messages.map((message) => message.fromDomain()).toList(),
      );
}
