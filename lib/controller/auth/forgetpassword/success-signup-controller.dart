
import 'package:get/get.dart';
import 'package:testapp/core/constant/app_routes.dart';

abstract class SuccessSignupController extends GetxController {
  Go_to_Login_Page();
}

class SuccessSignupControllerimp extends SuccessSignupController {
  @override
  Go_to_Login_Page() {
    Get.offAllNamed(AppRoutes.login);
  }
}
