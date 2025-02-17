import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllConversationUsecase
    implements UsecaseWithParams<List<Conversation>, String> {
  final ChatRepository chatRepository;

  GetAllConversationUsecase({required this.chatRepository});

  @override
  Future<Either<Failure, List<Conversation>>> call(String params) {
    return chatRepository.getAllConversations(params);
  }
}
