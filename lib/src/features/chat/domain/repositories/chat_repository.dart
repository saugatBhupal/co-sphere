import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:dartz/dartz.dart';

abstract interface class ChatRepository {
  Future<Either<Failure, Conversation>> getConversation(List<String> members);
  Future<Either<Failure, List<Conversation>>> getAllConversations(String uid);
  Future<Either<Failure, Conversation>> getConversationById(
      String conversationID);
  Future<Either<Failure, List<Message>>> getMessagesFromConversation(
      String conversationID);
  Future<Either<Failure, Message>> sendMessage(Message message);
}
