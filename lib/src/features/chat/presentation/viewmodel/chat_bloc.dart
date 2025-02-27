import 'package:bloc/bloc.dart';
import 'package:cosphere/src/config/socket_config/socket_service.dart';
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
  final SocketService _socketService = SocketService();
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
      if (event is SearchConversation) {
        await _searchConversation(event, emit);
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

  List<Conversation> _conversation = [];
  List<Conversation> get conversation => _conversation;
  Future<void> _getAllConversation(
      GetAllConversation event, Emitter<ChatState> emit) async {
    emit(GetConversationLoading());
    try {
      final result = await getAllConversationUsecase(event.uid);
      result.fold((failure) => emit(GetConversationFailed(failure.message)),
          (success) {
        _conversation = success;
        emit(GetAllConversationSuccess(conversation: success));
      });
    } catch (e) {
      emit(GetConversationFailed("Error: ${e.toString()}"));
    }
  }

  List<Message> _message = [];
  List<Message> get message => _message;

  Future<void> _getMessages(GetMessages event, Emitter<ChatState> emit) async {
    emit(GetMessagesLoading());
    try {
      final result =
          await getMessagesFromConversationUsecase(event.conversationID);
      result.fold((failure) => emit(GetMessageFailed(failure.message)),
          (success) {
        _message = success;
        emit(GetMessageSuccess(messages: success));
      });
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

  Future<void> _searchConversation(
      SearchConversation event, Emitter<ChatState> emit) async {
    emit(SearchLoading());
    try {
      final filteredConversations = _conversation.where((conversation) {
        return conversation.members
            .map((member) => member.fullname.toLowerCase())
            .contains(event.searchQuery.toLowerCase());
      }).toList();
      emit(SearchSuccess(conversation: filteredConversations));
    } catch (error) {
      emit(const SearchFailed("Result not fount"));
    }
  }
}
