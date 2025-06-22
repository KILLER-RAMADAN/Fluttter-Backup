

import 'package:testapp/core/class/crud.dart';
import 'package:testapp/servers.dart';

class Verifycode_reset {
  Crud crud;

  Verifycode_reset(this.crud);

  postverifycoderesetdata(String email, String code) async {
    var response = await crud.postData(Api.verifycoderesetpass, {
      "email": email,
      "verifycode": code,
    });
    return response.fold((l) => l, (r) => r);
  }
}
