import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testapp/core/constant/app_routes.dart';

Future<void> checkInitialMessage() async {
  RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
  if (message != null) {
    print("✅ التطبيق كان مغلقًا وتم فتحه عبر الإشعار");
    print(message.data);
    String? screen = message.data['screen'];
    if (screen != null) {
      Get.offNamed("/$screen");
    } else {
      Get.offNamed(AppRoutes.home);
    }
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void setupNotificationChannel() {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}
