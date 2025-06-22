import 'package:get/get.dart';
import 'package:testapp/core/class/crud.dart';

class Initialbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
