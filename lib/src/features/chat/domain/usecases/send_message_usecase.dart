import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:dartz/dartz.dart';

class SendMessageUsecase implements UsecaseWithParams<Message, Message> {
  final ChatRepository chatRepository;

  SendMessageUsecase({required this.chatRepository});

  @override
  Future<Either<Failure, Message>> call(Message params) {
    return chatRepository.sendMessage(params);
  }
}
