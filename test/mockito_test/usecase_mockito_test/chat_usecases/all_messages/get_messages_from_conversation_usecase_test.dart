import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_messages_from_conversation_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_messages_from_conversation_usecase_test.mocks.dart';

@GenerateMocks([ChatRepository])
void main() {
  late MockChatRepository mockChatRepository;
  late GetMessagesFromConversationUsecase getMessagesFromConversationUsecase;

  setUp(() {
    mockChatRepository = MockChatRepository();
    getMessagesFromConversationUsecase =
        GetMessagesFromConversationUsecase(chatRepository: mockChatRepository);
  });

  final dto = const Uuid().v4();
  test('should return the list of conversations', () async {
    final messages = [Message.initial(), Message.initial()];
    final messagesData = [
      Message.initial().copyWith(id: const Uuid().v4()),
      Message.initial()
    ];

    when(mockChatRepository.getMessagesFromConversation(dto))
        .thenAnswer((_) async => Right(messages));

    final result = await getMessagesFromConversationUsecase(dto);

    expect(result, Right(messagesData));
    verify(mockChatRepository.getMessagesFromConversation(dto)).called(1);
    verifyNoMoreInteractions(mockChatRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Missing required fields");

    when(mockChatRepository.getMessagesFromConversation(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await getMessagesFromConversationUsecase(dto);

    expect(result, const Left(failure));
    verify(mockChatRepository.getMessagesFromConversation(dto)).called(1);
    verifyNoMoreInteractions(mockChatRepository);
  });
}
