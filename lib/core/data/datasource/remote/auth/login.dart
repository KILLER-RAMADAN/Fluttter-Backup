


import 'package:testapp/core/class/crud.dart';
import 'package:testapp/servers.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postlogindata(String email, String password) async {
    var response = await crud.postData(Api.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
