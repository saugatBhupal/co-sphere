import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';

abstract class ChatRemoteDatasource {
  Future<Conversation> createConversation(List<String> members);
  Future<List<Conversation>> getAllConversations(String uid);
  Future<Conversation> getConversationById(String conversationID);
  Future<List<Message>> getMessagesFromConversation(String conversationID);
  Future<Message> sendMessage(Message message);
}
