
import 'package:get/get.dart';

import 'package:testapp/core/constant/app_routes.dart';

abstract class SuccessResetPassController extends GetxController {
  Go_to_Login_Page();
}

class SuccessResetPassControllerimp extends SuccessResetPassController {
  @override
  Go_to_Login_Page() {
    Get.offAllNamed(AppRoutes.login);
  }
}
