import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:testapp/core/middleware/mymiddleware.dart';
import 'package:testapp/views/language/language.dart';
import 'package:testapp/views/screens/auth/Forget_Password/forgrt-password.dart';
import 'package:testapp/views/screens/auth/Forget_Password/reset-password.dart';
import 'package:testapp/views/screens/auth/Forget_Password/successresetpass.dart';
import 'package:testapp/views/screens/auth/Forget_Password/successsignup.dart';
import 'package:testapp/views/screens/auth/Forget_Password/verify-reset-pass-code.dart';
import 'package:testapp/views/screens/auth/Forget_Password/verifycodesignup.dart';
import 'package:testapp/views/screens/auth/login.dart';
import 'package:testapp/views/screens/auth/signup.dart';
import 'package:testapp/views/screens/home/appsettings.dart';

import 'package:testapp/views/screens/home/home_screeen.dart';
import 'package:testapp/views/screens/onboarding/onBoarding.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => appLanguage(), middlewares: [Mymiddleware()]),
  // GetPage(name: "/", page: () => SelectSallaItems()),  ]middlewares: [Mymiddleware()]

  GetPage(name: AppRoutes.login, page: () => Login()),
  GetPage(name: AppRoutes.onBoarding, page: () => onBoarding()),

  GetPage(name: AppRoutes.SignUp, page: () => Signup()),
  GetPage(name: AppRoutes.forgetpass, page: () => ForgrtPassword()),
  GetPage(name: AppRoutes.verifycode, page: () => Verifypassword()),
  GetPage(name: AppRoutes.resetpass, page: () => ResetPassword()),
  GetPage(name: AppRoutes.successresetpass, page: () => Successresetpass()),
  GetPage(name: AppRoutes.successsignup, page: () => Successsignup()),
  GetPage(name: AppRoutes.verifycodesignup, page: () => Verifycodesignup()),
  // Home //
  GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  GetPage(name: AppRoutes.settings, page: () => Appsettings()),


  // GetPage(name: AppRoutes.archive, page: () => ArchiveOrders()),

  // settings //
];
