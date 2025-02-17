import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetConversationByIdUsecase
    implements UsecaseWithParams<Conversation, String> {
  final ChatRepository chatRepository;

  GetConversationByIdUsecase({required this.chatRepository});

  @override
  Future<Either<Failure, Conversation>> call(String params) {
    return chatRepository.getConversationById(params);
  }
}
