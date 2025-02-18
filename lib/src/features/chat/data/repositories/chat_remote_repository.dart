import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/data/datasources/remote/chat_remote_datasource.dart';
import 'package:cosphere/src/features/chat/data/dto/send_message_request_dto.dart';
import 'package:cosphere/src/features/chat/data/models/conversation_api_model.dart';
import 'package:cosphere/src/features/chat/data/models/mapppers/conversation_mapper.dart';
import 'package:cosphere/src/features/chat/data/models/mapppers/message_mappers.dart';
import 'package:cosphere/src/features/chat/data/models/message_api_model.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class ChatRemoteRepository implements ChatRepository {
  final ChatRemoteDatasource chatRemoteDatasource;

  ChatRemoteRepository({required this.chatRemoteDatasource});
  @override
  Future<Either<Failure, Conversation>> getConversation(
      List<String> members) async {
    try {
      final ConversationApiModel conversationApiModel =
          await chatRemoteDatasource.getConversation(members);
      return Right(conversationApiModel.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Conversation>>> getAllConversations(
      String uid) async {
    try {
      final List<ConversationApiModel> conversations =
          await chatRemoteDatasource.getAllConversations(uid);
      return Right(conversations
          .map((conversation) => conversation.toDomain())
          .toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Conversation>> getConversationById(
      String conversationID) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Message>>> getMessagesFromConversation(
      String conversationID) async {
    try {
      final List<MessageApiModel> messages = await chatRemoteDatasource
          .getMessagesFromConversation(conversationID);
      return Right(messages.map((message) => message.toDomain()).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Message>> sendMessage(
      SendMessageRequestDto message) async {
    try {
      final MessageApiModel messageApiModel =
          await chatRemoteDatasource.sendMessage(message);
      return Right(messageApiModel.toDomain());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
