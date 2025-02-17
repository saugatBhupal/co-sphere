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
