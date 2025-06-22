

import 'package:testapp/core/class/crud.dart';
import 'package:testapp/servers.dart';

class ResetAccountPassword {
  Crud crud;

  ResetAccountPassword(this.crud);

  postresetpassdata(String email, String password) async {
    var response = await crud.postData(Api.reset_password, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
