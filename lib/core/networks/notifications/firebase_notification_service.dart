part of 'push_notification_service.dart';

class FirebaseNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init() async {
    final isPermissionGranted = await requestPermission();
    if (!isPermissionGranted) {
      return;
    }

    await getFCMToken();

    await LocalNotificationService.init();
    await LocalNotificationService.createNotificationChannel();

    await setupInteractionHandler();
    await setupForegroundHandler();
  }

  Future<bool> requestPermission() async {
    final settings = await _fcm.requestPermission();

    return settings.authorizationStatus == AuthorizationStatus.authorized;
  }

  Future<void> getFCMToken() async {
    String? token = await _fcm.getToken();

    if (token != null) {
      // TODO: implement token handling
    }
  }

  Future<void> setupInteractionHandler() async {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // TODO: implement notification click
    });
  }

  Future<void> setupForegroundHandler() async {
    FirebaseMessaging.onMessage.listen(_showNotification);
  }

  Future<void> _showNotification(RemoteMessage message) async {
    final notification = message.notification;
    final data = message.data;

    if (notification != null) {
      await LocalNotificationService.showNotification(
        id: message.hashCode,
        title: notification.title,
        body: notification.body,
        payload: data.toString(),
      );
    }
  }
}
