import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/core/http/api_endpoints.dart';
import 'package:cosphere/src/core/http/handle_error_response.dart';
import 'package:cosphere/src/features/notification/data/datasources/remote/notification_remote_datasource.dart';
import 'package:cosphere/src/features/notification/data/models/notification_api_model.dart';
import 'package:dio/dio.dart';

class NotificationRemoteDatasourceImpl implements NotificationRemoteDatasource {
  final Dio dio;

  NotificationRemoteDatasourceImpl({required this.dio});
  @override
  Future<List<NotificationApiModel>> getNotificationsByUserId(
      String uid) async {
    try {
      var res = await dio.get("${ApiEndpoints.user}$uid/notification");
      if (res.statusCode == 200) {
        var notifications = res.data['notifications'] as List;
        return notifications
            .map((notification) => NotificationApiModel.fromJson(notification))
            .toList();
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<String> deleteAllNotificationsByUserId(String uid) async {
    try {
      var res = await dio.delete("${ApiEndpoints.user}$uid/notification");
      if (res.statusCode == 200) {
        return res.data['message'];
      } else {
        throw Failure(
          message: res.statusMessage.toString(),
          statusCode: res.statusMessage.toString(),
        );
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }
}
