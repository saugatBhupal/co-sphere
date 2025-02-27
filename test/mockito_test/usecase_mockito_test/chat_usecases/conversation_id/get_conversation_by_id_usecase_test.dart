import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_conversation_by_id_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_conversation_by_id_usecase_test.mocks.dart';

@GenerateMocks([ChatRepository])
void main() {
  late MockChatRepository mockChatRepository;
  late GetConversationByIdUsecase getConversationByIdUsecase;

  setUp(() {
    mockChatRepository = MockChatRepository();
    getConversationByIdUsecase =
        GetConversationByIdUsecase(chatRepository: mockChatRepository);
  });

  final dto = const Uuid().v4();
  test('should return the conversations of the id', () async {
    final conversation = Conversation.initial();

    when(mockChatRepository.getConversationById(dto))
        .thenAnswer((_) async => Right(conversation));

    final result = await getConversationByIdUsecase(dto);

    expect(result, Right(conversation));
    verify(mockChatRepository.getConversationById(dto)).called(1);
    verifyNoMoreInteractions(mockChatRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Missing required fields");

    when(mockChatRepository.getConversationById(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await getConversationByIdUsecase(dto);

    expect(result, const Left(failure));
    verify(mockChatRepository.getConversationById(dto)).called(1);
    verifyNoMoreInteractions(mockChatRepository);
  });
}
