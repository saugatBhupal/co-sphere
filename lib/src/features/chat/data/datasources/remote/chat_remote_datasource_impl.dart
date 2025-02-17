import 'package:cosphere/src/features/chat/data/datasources/remote/chat_remote_datasource.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:dio/dio.dart';

class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  final Dio dio;

  ChatRemoteDatasourceImpl({required this.dio});
  @override
  Future<Conversation> createConversation(List<String> members) {
    throw UnimplementedError();
  }

  @override
  Future<List<Conversation>> getAllConversations(String uid) {
    throw UnimplementedError();
  }

  @override
  Future<Conversation> getConversationById(String conversationID) {
    throw UnimplementedError();
  }

  @override
  Future<List<Message>> getMessagesFromConversation(String conversationID) {
    throw UnimplementedError();
  }

  @override
  Future<Message> sendMessage(Message message) {
    throw UnimplementedError();
  }
}
