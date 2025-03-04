import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_all_conversation_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_all_conversations_usecase_test.mocks.dart';

@GenerateMocks([ChatRepository])
void main() {
  late MockChatRepository mockChatRepository;
  late GetAllConversationUsecase getAllConversationUsecase;

  setUp(() {
    mockChatRepository = MockChatRepository();
    getAllConversationUsecase =
        GetAllConversationUsecase(chatRepository: mockChatRepository);
  });

  final dto = const Uuid().v4();
  test('should return the list of conversations', () async {
    final conversation = [Conversation.initial(), Conversation.initial()];
    final conversationData = [
      Conversation.initial().copyWith(id: const Uuid().v4()),
      Conversation.initial().copyWith(id: const Uuid().v4()),
    ];

    when(mockChatRepository.getAllConversations(dto))
        .thenAnswer((_) async => Right(conversation));

    final result = await getAllConversationUsecase(dto);

    expect(result, Right(conversationData));
    verify(mockChatRepository.getAllConversations(dto)).called(1);
    verifyNoMoreInteractions(mockChatRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Missing required fields");

    when(mockChatRepository.getAllConversations(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await getAllConversationUsecase(dto);

    expect(result, const Left(failure));
    verify(mockChatRepository.getAllConversations(dto)).called(1);
    verifyNoMoreInteractions(mockChatRepository);
  });
}
