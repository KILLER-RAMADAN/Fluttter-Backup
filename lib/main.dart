import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testapp/Binding/initialbinding.dart';
import 'package:testapp/controller/themes/theme_controller.dart';
import 'package:testapp/core/constant/themes.dart';
import 'package:testapp/core/localizations/changelocal.dart';
import 'package:testapp/core/localizations/translation.dart';
import 'package:testapp/core/services/services.dart';
import 'package:testapp/firebase_options.dart';
import 'package:testapp/notifications_handling.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance
      .requestPermission(); // FOR REQUEST PERMISSION
  await initialServices(); // FOR SHAREDPREFERENCES
  setupNotificationChannel(); // TO SETUP NOTIFICATION CHANNEL
  checkInitialMessage(); // TO CHECK INITIAL MESSAGE
  runApp(const MyApp()); // CALL THE MAIN APP
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Localcontroller controller = Get.put(Localcontroller());
    ThemeController themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Mytranslation(),
        getPages: routes,
        themeMode:
            themeController.themeMode.value, // Use the reactive theme mode
        darkTheme: Themes.dark,
        theme: Themes.light,
        locale: controller.language,
        initialBinding: Initialbindings(),
      ),
    );
  }
}
