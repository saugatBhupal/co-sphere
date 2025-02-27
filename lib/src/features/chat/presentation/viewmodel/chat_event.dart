part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class GetConversation extends ChatEvent {
  final List<String> members;

  const GetConversation({required this.members});
}

class GetAllConversation extends ChatEvent {
  final String uid;

  const GetAllConversation({required this.uid});
}

class GetMessages extends ChatEvent {
  final String conversationID;

  const GetMessages({required this.conversationID});
}

class SendMessage extends ChatEvent {
  final SendMessageRequestDto dto;

  const SendMessage({required this.dto});
}

class SearchConversation extends ChatEvent {
  final String searchQuery;

  const SearchConversation({required this.searchQuery});
}

class MessageReceived extends ChatEvent {
  final String conversationID;

  const MessageReceived({required this.conversationID});
}
