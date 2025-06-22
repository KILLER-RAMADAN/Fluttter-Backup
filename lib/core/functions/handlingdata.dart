
import 'package:testapp/core/class/statuesrequest.dart';

Handlingdata(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
