import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:notification_listener/notification_listener.dart';

get_notification_permision() async {
  final bool isGranted = await AndroidNotificationListener.isGranted();
  if (isGranted) {
    Get.snackbar(
      'Permission Granted',
      'Notification access has been granted.',
      snackPosition: SnackPosition.BOTTOM,
    );
    print('Notification access granted!');
  } else {
    Get.snackbar(
      'Permission Denied',
      'Notification access has been denied. Please enable it in settings.',
      snackPosition: SnackPosition.BOTTOM,
    );
    AndroidNotificationListener.request();
    print('Notification access denied.');
  }
}
