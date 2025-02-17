import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/data/datasources/remote/chat_remote_datasource.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class ChatRemoteRepository implements ChatRepository {
  final ChatRemoteDatasource chatRemoteDatasource;

  ChatRemoteRepository({required this.chatRemoteDatasource});
  @override
  Future<Either<Failure, Conversation>> createConversation(
      List<String> members) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Conversation>>> getAllConversations(String uid) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Conversation>> getConversationById(
      String conversationID) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Message>>> getMessagesFromConversation(
      String conversationID) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Message>> sendMessage(Message message) {
    throw UnimplementedError();
  }
}
