
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testapp/controller/auth/signupcontroller.dart';
import 'package:testapp/core/constant/app_routes.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

Signupcontrollerimp controller = Get.put(Signupcontrollerimp());
openWhatsApp(String mobilenumber) {

  Get.offAllNamed(AppRoutes.verifycodesignup,
      arguments: {"email": controller.email.text});
}

launchWhatsAppString() async {
  final link = WhatsAppUnilink(
    phoneNumber: '+966 53 917 4225',
    text: " السلام عليكم من فضلك اريد تفعيل الجساب الخاص بي",
  );

  await launchUrlString('$link');
}
