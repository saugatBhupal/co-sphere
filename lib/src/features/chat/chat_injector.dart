import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/chat/data/datasources/remote/chat_remote_datasource.dart';
import 'package:cosphere/src/features/chat/data/datasources/remote/chat_remote_datasource_impl.dart';
import 'package:cosphere/src/features/chat/data/repositories/chat_remote_repository.dart';
import 'package:cosphere/src/features/chat/domain/repositories/chat_repository.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_all_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_conversation_by_id_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/get_messages_from_conversation_usecase.dart';
import 'package:cosphere/src/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:cosphere/src/features/chat/presentation/viewmodel/chat_bloc.dart';

void initChat() {
  sl.registerLazySingleton<ChatRemoteDatasource>(
      () => ChatRemoteDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<ChatRepository>(
      () => ChatRemoteRepository(chatRemoteDatasource: sl()));
  sl.registerLazySingleton<GetConversationUsecase>(
      () => GetConversationUsecase(chatRepository: sl()));
  sl.registerLazySingleton<GetAllConversationUsecase>(
      () => GetAllConversationUsecase(chatRepository: sl()));
  sl.registerLazySingleton<GetConversationByIdUsecase>(
      () => GetConversationByIdUsecase(chatRepository: sl()));
  sl.registerLazySingleton<GetMessagesFromConversationUsecase>(
      () => GetMessagesFromConversationUsecase(chatRepository: sl()));
  sl.registerLazySingleton<SendMessageUsecase>(
      () => SendMessageUsecase(chatRepository: sl()));
  sl.registerFactory<ChatBloc>(() => ChatBloc(
      getConversationUsecase: sl(),
      getAllConversationUsecase: sl(),
      getMessagesFromConversationUsecase: sl(),
      sendMessageUsecase: sl()));
}
