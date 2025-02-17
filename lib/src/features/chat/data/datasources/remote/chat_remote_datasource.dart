import 'package:cosphere/src/features/chat/data/models/conversation_api_model.dart';
import 'package:cosphere/src/features/chat/data/models/message_api_model.dart';

abstract class ChatRemoteDatasource {
  Future<ConversationApiModel> getConversation(List<String> members);
  Future<List<ConversationApiModel>> getAllConversations(String uid);
  Future<ConversationApiModel> getConversationById(String conversationID);
  Future<List<MessageApiModel>> getMessagesFromConversation(
      String conversationID);
  Future<MessageApiModel> sendMessage(MessageApiModel message);
}
