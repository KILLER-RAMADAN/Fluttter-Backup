
import 'package:testapp/core/class/crud.dart';
import 'package:testapp/servers.dart';

class Verifycode {
  Crud crud;

  Verifycode(this.crud);

  postverifycodedata(String email, String code) async {
    var response = await crud.postData(Api.verifycodesignup, {
      "email": email,
      "verifycode": code,
    });
    return response.fold((l) => l, (r) => r);
  }
}
