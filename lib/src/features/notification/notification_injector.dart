import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/notification/data/datasources/remote/notification_remote_datasource.dart';
import 'package:cosphere/src/features/notification/data/datasources/remote/notification_remote_datasource_impl.dart';
import 'package:cosphere/src/features/notification/data/repositories/notification_remote_repository.dart';
import 'package:cosphere/src/features/notification/domain/repositories/notification_repository.dart';
import 'package:cosphere/src/features/notification/domain/usecases/delete_notification_by_userid_usecae.dart';
import 'package:cosphere/src/features/notification/domain/usecases/get_notification_by_user_id_usecase.dart';
import 'package:cosphere/src/features/notification/presentation/viewmodel/notification_bloc.dart';

void initNotification() {
  sl.registerLazySingleton<NotificationRemoteDatasource>(
      () => NotificationRemoteDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<NotificationRepository>(
      () => NotificationRemoteRepository(notificationDatasource: sl()));
  sl.registerLazySingleton<GetNotificationByUserIdUsecase>(
      () => GetNotificationByUserIdUsecase(notificationRepository: sl()));
  sl.registerLazySingleton<DeleteNotificationByUserIdUsecae>(
      () => DeleteNotificationByUserIdUsecae(notificationRepository: sl()));
  sl.registerFactory<NotificationBloc>(() => NotificationBloc(
      getNotificationByUserIdUsecase: sl(),
      deleteNotificationsByUserIdUsecase: sl()));
}
