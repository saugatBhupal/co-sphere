import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class GetMessagesFromConversationUsecase
    implements UsecaseWithParams<List<Message>, String> {
  final ChatRepository chatRepository;

  GetMessagesFromConversationUsecase({required this.chatRepository});
  @override
  Future<Either<Failure, List<Message>>> call(String params) {
    return chatRepository.getMessagesFromConversation(params);
  }
}
