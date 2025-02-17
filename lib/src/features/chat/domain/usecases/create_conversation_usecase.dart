import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class CreateConversationUsecase
    implements UsecaseWithParams<Conversation, List<String>> {
  final ChatRepository chatRepository;

  CreateConversationUsecase({required this.chatRepository});

  @override
  Future<Either<Failure, Conversation>> call(List<String> params) {
    return chatRepository.createConversation(params);
  }
}
