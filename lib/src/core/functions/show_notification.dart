import 'package:cosphere/src/config/notification_config/notification_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void showNotification(Map<String, dynamic> data) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'channel_id',
    'Channel Name',
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
    icon: "@mipmap/ic_launcher",
  );

  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.show(
    0,
    "Co-Sphere Notification",
    data['data'],
    notificationDetails,
  );
}
