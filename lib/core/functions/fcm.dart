import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_manager/flutter_ringtone_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testapp/notifications_handling.dart';

requistpermitionnotfy() async {
  // ignore: unused_local_variable
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

printconfig() {
  checkInitialMessage();
  FirebaseMessaging.onMessage.listen((message) {
    message.notification!.title;
    message.notification!.body;
    print(message.data);
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    FlutterRingtoneManager().playNotification();
  });
}

// refresh_function_data(data) {
//   print(data["page_id"]);
//   print(data["page_name"]);

//   if (Get.currentRoute == "/orders" && data["page_name"] == "order") {
//     PendingOrdersController controller = Get.find();
//     controller.refresh_orders();
//   }
// }
