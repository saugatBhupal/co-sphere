import 'package:bloc_test/bloc_test.dart';
import 'package:cosphere/src/features/chat/data/dto/send_message_request_dto.dart';
import 'package:cosphere/src/features/chat/domain/entities/conversation.dart';
import 'package:cosphere/src/features/chat/domain/entities/message.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_all_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_messages_from_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:cosphere/src/features/chat/presentation/viewmodel/chat_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'chat_viewmodel_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetConversationUsecase>(),
  MockSpec<GetAllConversationUsecase>(),
  MockSpec<GetMessagesFromConversationUsecase>(),
  MockSpec<SendMessageUsecase>(),
])
void main() {
  group('ChatViewmodels', () {
    late GetConversationUsecase mockGetConversationUsecase;
    late GetAllConversationUsecase mockGetAllConversationUsecase;
    late GetMessagesFromConversationUsecase
        mockGetMessagesFromConversationUsecase;
    late SendMessageUsecase mockSendMessageUsecase;

    setUp(() {
      mockGetConversationUsecase = MockGetConversationUsecase();
      mockGetAllConversationUsecase = MockGetAllConversationUsecase();
      mockGetMessagesFromConversationUsecase =
          MockGetMessagesFromConversationUsecase();
      mockSendMessageUsecase = MockSendMessageUsecase();
    });

    blocTest<ChatBloc, ChatState>(
      'emits [MyState] when MyEvent is added',
      build: () => ChatBloc(
          getConversationUsecase: mockGetConversationUsecase,
          getAllConversationUsecase: mockGetAllConversationUsecase,
          getMessagesFromConversationUsecase:
              mockGetMessagesFromConversationUsecase,
          sendMessageUsecase: mockSendMessageUsecase),
      act: (bloc) async {
        final userId = const Uuid().v4();
        final conversationID = const Uuid().v4();
        final conversation = [Conversation.initial(), Conversation.initial()];
        final messages = [Message.initial(), Message.initial()];
        // Get Conversation
        final conversationDto = [const Uuid().v4(), const Uuid().v4()];

        when(mockGetConversationUsecase.call(conversationDto))
            .thenAnswer((_) async => Right(conversation.first));
        bloc.add(GetConversation(members: conversationDto));

        // All Conversations
        when(mockGetAllConversationUsecase.call(userId))
            .thenAnswer((_) async => Right(conversation));
        bloc.add(GetAllConversation(uid: userId));

        // Get Messages
        when(mockGetMessagesFromConversationUsecase.call(userId))
            .thenAnswer((_) async => Right(messages));
        bloc.add(GetMessages(conversationID: conversationID));

        // Send Message
        final sendDto = SendMessageRequestDto(
            conversationID: conversationID,
            content: 'test message',
            senderID: userId);

        when(mockSendMessageUsecase.call(sendDto))
            .thenAnswer((_) async => Right(messages.first));
        bloc.add(SendMessage(dto: sendDto));
      },
      expect: () => [
        isA<GetConversationLoading>(),
        isA<GetConversationSuccess>(),
        isA<GetConversationLoading>(),
        isA<GetAllConversationSuccess>(),
        isA<GetMessagesLoading>(),
        isA<GetMessageSuccess>(),
        // isA<GetMessageFailed>(),
        isA<SendMessageLoading>(),
        isA<SendMessageSuccess>(),
      ],
    );
  });
}
