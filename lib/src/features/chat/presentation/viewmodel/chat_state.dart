part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

class GetConversationLoading extends ChatState {}

class GetConversationSuccess extends ChatState {
  final Conversation conversation;

  const GetConversationSuccess({required this.conversation});
}

class GetConversationFailed extends ChatState {
  final String message;

  const GetConversationFailed(this.message);
}

class GetAllConversationSuccess extends ChatState {
  final List<Conversation> conversation;

  const GetAllConversationSuccess({required this.conversation});
}

class GetMessagesLoading extends ChatState {}

class GetMessageSuccess extends ChatState {
  final List<Message> messages;

  const GetMessageSuccess({required this.messages});
}

class GetMessageFailed extends ChatState {
  final String message;

  const GetMessageFailed(this.message);
}

class SendMessageLoading extends ChatState {}

class SendMessageSuccess extends ChatState {
  final Message message;

  const SendMessageSuccess({required this.message});
}

class SendMessageFailed extends ChatState {
  final String message;

  const SendMessageFailed(this.message);
}
