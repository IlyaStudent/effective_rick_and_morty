import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'firebase_background_handler.dart';
part 'local_notification_service.dart';
part 'firebase_notification_service.dart';

class PushNotificationService {
  static Future<void> initialize() async {
    await _setupBackgroundHandler();

    await Firebase.initializeApp();

    final FirebaseNotificationService firebaseNotificationService =
        FirebaseNotificationService();

    firebaseNotificationService.init();
  }

  static Future<void> _setupBackgroundHandler() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  }
}
