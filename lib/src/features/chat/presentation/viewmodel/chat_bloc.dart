import 'package:bloc/bloc.dart';
import 'package:cosphere/src/features/chat/data/dto/send_message_request_dto.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_all_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_messages_from_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetConversationUsecase getConversationUsecase;
  final GetAllConversationUsecase getAllConversationUsecase;
  final GetMessagesFromConversationUsecase getMessagesFromConversationUsecase;
  final SendMessageUsecase sendMessageUsecase;
  ChatBloc({
    required this.getConversationUsecase,
    required this.getAllConversationUsecase,
    required this.getMessagesFromConversationUsecase,
    required this.sendMessageUsecase,
  }) : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {
      if (event is GetConversation) {
        await _getConversation(event, emit);
      }
      if (event is GetAllConversation) {
        await _getAllConversation(event, emit);
      }
      if (event is GetMessages) {
        await _getMessages(event, emit);
      }
      if (event is SendMessage) {
        await _sendMessage(event, emit);
      }
    });
  }

  Future<void> _getConversation(
      GetConversation event, Emitter<ChatState> emit) async {
    emit(GetConversationLoading());
    try {
      final result = await getConversationUsecase(event.members);
      result.fold(
        (failure) => emit(GetConversationFailed(failure.message)),
        (success) => emit(GetConversationSuccess(conversation: success)),
      );
    } catch (e) {
      emit(GetConversationFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _getAllConversation(
      GetAllConversation event, Emitter<ChatState> emit) async {
    emit(GetConversationLoading());
    try {
      final result = await getAllConversationUsecase(event.uid);
      result.fold(
        (failure) => emit(GetConversationFailed(failure.message)),
        (success) => emit(GetAllConversationSuccess(conversation: success)),
      );
    } catch (e) {
      emit(GetConversationFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _getMessages(GetMessages event, Emitter<ChatState> emit) async {
    emit(GetMessagesLoading());
    try {
      final result =
          await getMessagesFromConversationUsecase(event.conversationID);
      result.fold(
        (failure) => emit(GetMessageFailed(failure.message)),
        (success) => emit(GetMessageSuccess(messages: success)),
      );
    } catch (e) {
      emit(GetConversationFailed("Error: ${e.toString()}"));
    }
  }

  Future<void> _sendMessage(SendMessage event, Emitter<ChatState> emit) async {
    emit(SendMessageLoading());
    try {
      final result = await sendMessageUsecase(event.dto);
      result.fold(
        (failure) => emit(SendMessageFailed(failure.message)),
        (success) => emit(SendMessageSuccess(message: success)),
      );
    } catch (e) {
      emit(GetConversationFailed("Error: ${e.toString()}"));
    }
  }
}
