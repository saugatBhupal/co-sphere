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
