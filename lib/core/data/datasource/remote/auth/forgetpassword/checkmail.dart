

import 'package:testapp/core/class/crud.dart';
import 'package:testapp/servers.dart';

class CheckmailData {
  Crud crud;

  CheckmailData(this.crud);

  cheeckmaildata(String email) async {
    var response = await crud.postData(Api.checkmail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
