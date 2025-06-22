import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:notification_listener/notification_listener.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/services/services.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  bool notificationsDisable = false;

  @override
  void onInit() {
    notificationsDisable =
        myServices.sharedPreferences.getBool('notificationsEnabled') == null
            ? false
            : myServices.sharedPreferences.getBool('notificationsEnabled')!;
    print(notificationsDisable);
    FirebaseMessaging.instance.requestPermission();
    super.onInit();
  }

  void signout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  get_notification_permision() async {
    final bool isGranted = await AndroidNotificationListener.isGranted();
    if (isGranted) {
      print('Notification access granted!');
    } else {
      AndroidNotificationListener.request();
      print('Notification access denied.');
    }
  }

  void toggleNotifications(bool value) {
    myServices.sharedPreferences.setBool('notificationsEnabled', value);
    //print(myServices.sharedPreferences.getBool('notificationsEnabled'));
    notificationsDisable =
        myServices.sharedPreferences.getBool('notificationsEnabled') == null
            ? false
            : myServices.sharedPreferences.getBool('notificationsEnabled')!;
    print(notificationsDisable);
    update();

    if (notificationsDisable == true) {
      FirebaseMessaging.instance.unsubscribeFromTopic('Spam');
    } else {
      FirebaseMessaging.instance.subscribeToTopic('Spam');
    }
  }
}
