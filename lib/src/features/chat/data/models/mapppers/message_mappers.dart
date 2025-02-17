import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/features/chat/data/models/message_api_model.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';

extension MessageApiModelMappers on MessageApiModel {
  Message toDomain() => Message.initial().copyWith(
        id: id,
        content: content,
        sender: sender.toDomain(),
        sent: sent,
      );
}

extension MessageMappers on Message {
  MessageApiModel fromDomain() => MessageApiModel(
        id: id,
        content: content,
        sender: sender.toApiModel(),
        sent: sent,
      );
}
