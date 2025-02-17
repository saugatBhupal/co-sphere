import 'package:bloc/bloc.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_all_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_conversation_usecase.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetConversationUsecase getConversationUsecase;
  final GetAllConversationUsecase getAllConversationUsecase;
  ChatBloc({
    required this.getConversationUsecase,
    required this.getAllConversationUsecase,
  }) : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {
      if (event is GetConversation) {
        await _getConversation(event, emit);
      }
      if (event is GetAllConversation) {
        await _getAllConversation(event, emit);
      }
    });
  }

  Future<void> _getConversation(
      GetConversation event, Emitter<ChatState> emit) async {
    emit(GetConversationLoading());
    try {
      final result = await getConversationUsecase(event.members);
      result.fold((failure) => emit(GetConversationFailed(failure.message)),
          // (success) => emit(GetConversationSuccess(conversation: success)),
          (success) {
        print(success);
        emit(GetConversationSuccess(conversation: success));
      });
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
}
