part of 'push_notification_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  await LocalNotificationService.init();
  await LocalNotificationService.createNotificationChannel();

  final notification = message.notification;
  if (notification != null) {
    await LocalNotificationService.showNotification(
      id: message.hashCode,
      title: notification.title,
      body: notification.body,
      payload: message.data.toString(),
    );
  }
}
