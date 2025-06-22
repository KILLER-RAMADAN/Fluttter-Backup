

import 'package:testapp/core/class/crud.dart';
import 'package:testapp/servers.dart';

class SignupData {
  Crud crud;

  SignupData(this.crud);

  postsignupdata(
      String username, String email, String phone, String password) async {
    var response = await crud.postData(Api.signup, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
