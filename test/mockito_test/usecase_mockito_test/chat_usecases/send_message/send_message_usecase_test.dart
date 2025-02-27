import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/data/dto/send_message_request_dto.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:cosphere/src/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'send_message_usecase_test.mocks.dart';

@GenerateMocks([ChatRepository])
void main() {
  late MockChatRepository mockChatRepository;
  late SendMessageUsecase sendMessageUsecase;

  setUp(() {
    mockChatRepository = MockChatRepository();
    sendMessageUsecase = SendMessageUsecase(chatRepository: mockChatRepository);
  });

  final dto = SendMessageRequestDto(
      conversationID: const Uuid().v4(),
      content: 'test message',
      senderID: const Uuid().v4());
  test('should return the message that was sent', () async {
    final messages = Message.initial();

    when(mockChatRepository.sendMessage(dto))
        .thenAnswer((_) async => Right(messages));

    final result = await sendMessageUsecase(dto);

    expect(result, Right(messages));
    verify(mockChatRepository.sendMessage(dto)).called(1);
    verifyNoMoreInteractions(mockChatRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Missing required fields");

    when(mockChatRepository.sendMessage(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await sendMessageUsecase(dto);

    expect(result, const Left(failure));
    verify(mockChatRepository.sendMessage(dto)).called(1);
    verifyNoMoreInteractions(mockChatRepository);
  });
}
