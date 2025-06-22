import 'package:dio/dio.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:testapp/core/services/services.dart';

class SendNotificationV2 extends GetxController {
  MyServices myServices = Get.find();
  late String token = '';
  late String auth_token = '';

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   //print(value);
    //   token = value!;
    // });

    super.onInit();
  }

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "spamdetection-cfa53",
      "private_key_id": "ff9d12d58ca0e1ba109ccff459acc51e482dbb98",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCwGVcgIC/xirpq\nCC221AUmLQA4ZJ7VyOhiYft1znca3LI7mbXU+Om9NtYfcWFOFifVkuqaxossBoAl\n+3cLWZf6vFPzCUAt0/le36yUiPmDr4HPYwKLxNLThCpmCsDAg9AhV3meOIusuYyd\nbcaApF1eHueL0jqMTrVoijnvqUNsOlXhAskoHTerGUUuVgy2um7KFXXF1QZUgXJJ\n1/9EHIhDA1MoGpw9/ZJ5HWxNBQQ1oiqLBn5Y0EAUcpQMtKTRHdMClbTev3eqj8qr\nPi1QiPnLS2Hkfq2lb1YbqSfM7HkYengeNEKds8cMclAvfx92KWJA+PCOKTflBpYb\nJngU2PvHAgMBAAECggEAAbggSCGC+6Y26ghuEyi1wNN+pY5MmK9knr/webbMJeMo\nCvnrXbVtFBpVc9V3tZCfee/RwjS/BhfYJ3FxjkGlK18BqM/weaIQqghKrIvmd7kp\nGMe8LiDRTXGvDPOnlxmSWMj8WHrv2NNaQpfgRhWUuHGvzAcqPYAajaHlLT2nTrFX\noN5mx1+k3LdxnkMDK124Q+g2I86SJnkEkpTiYEHUZQkfMuibmGZo8SQtS0qwpbjB\n6UiXAsJOuK4po28JIQO22mZay8xYP30tK2qMY/0zbIJOeaXFSu5hjOrV5ZFNwrga\nj+nTPL2NIOxHDUj/uqWjSPeJA/iPyXOqZnBcDsur7QKBgQDXFXJN2+5STbrIzSFu\ni68TkVsZhYOfR7luXij1DQ6Y6+Hs0WNv3rL5PtaJWwWHjZBg8clOCNu6udqzdxbL\nU/FsUxXObaYSoNfLaVmfW4S2RHTuFaWVHFixlC7XZcQVe4tEqLxA2Ty2GFDoJ3N7\nV2/NKxbx3Zyl+VF5CakohTPgswKBgQDRmVbf0FCtVthRJyNfzO5L1WDI8FifHR5J\nTIa2iWTDcxCAZmWd/6oWLErYwVMzI6xO0R6pvNswViv9BRv9nJPhid+UfhzpEnwN\nKEP9cBQrXqsdNC0TL8uyeuuNH8rVXefR5K0YA3/aruIiHxkJ9G8OirfsnaWKPyXv\nezaPcvIanQKBgQDJoMxH2v3+X+nTJiHKHN5ibKhHM5ehML7PjSu+FaBykOZ5eA1M\nqSuEZnj9yLtVSMtpZiB9q+Y4lNRF20UeFTJEh1rw6m9+FRRXFwqyTjwKFgC71MUm\nFK28wxpqSHdaYDe9hKT98ehtGDx4dctXfC9N2bAnysV3/lJ3MixG1SA96wKBgFTN\nicy8aCf5/0O2ZiWYsMGV77bdJ74Y9ewKPmcUZ+R8ZazNwUeP7a1S9mWEsrj6Mfkh\nuxpKAxUniFyy+IRAGcUjF4bpD6FtjSt1oyyjcEWr4+fI+IPOzsfD3BIZTuPNPsI5\nl58jq1M7dtr/Yg4ZC+YCUjA2CIhKzHp8i7K2eyYxAoGATCU7BCc2/PWcA1NnxGQ4\n+TmQo6DG6DYO92FnMB3yg5+FZHLrZqd2l7sLw4hooWsAytNeJuJZeRy6hgdbhzdQ\n5B9YxuRVNirF49BGrCeVW50lzmovHzUS7utzOk5gFIKTAqbNAdwU/N7WJgVxuHay\no4BxE8Jm0TD8mTFIH0a62ks=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-17pip@spamdetection-cfa53.iam.gserviceaccount.com",
      "client_id": "108432245983519304144",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-17pip%40spamdetection-cfa53.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

      auth.AccessCredentials credentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
              auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
              scopes,
              client);

      client.close();
      // print("Access Token: ${credentials.accessToken.data}");
      auth_token = credentials.accessToken.data; // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

  Map<String, dynamic> getBody({
    required String Topic,
    required String title,
    required String body,
    required String userId,
    required String page_id,
    required String page_name,
    String? type,
  }) {
    return {
      "message": {
        "token": '/topics/$Topic',
        "notification": {"title": title, "body": body},
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_HIGH",
            "sound": "default"
          }
        },
        "apns": {
          "payload": {
            "aps": {"content_available": true}
          }
        },
        "data": {
          "type": type,
          "id": userId,
          "page_id": page_id,
          "page_name": page_name,
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        }
      }
    };
  }

  Future<void> sendNotifications({
    required String Topic,
    required String title,
    required String body,
    required String page_id,
    required String page_name,
    required String userId,
    String? type,
  }) async {
    try {
      var serverKeyAuthorization = await getAccessToken();

      // change your project id
      const String urlEndPoint =
          "https://fcm.googleapis.com/v1/projects/spamdetection-cfa53/messages:send";

      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      var response = await dio.post(
        urlEndPoint,
        data: getBody(
          userId: userId,
          Topic: Topic,
          title: title,
          body: body,
          page_id: page_id,
          page_name: page_name,
          type: type ?? "message",
        ),
      );

      // Print response status code and body for debugging
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}


// SendNotificationController send_notify =
//         Get.put(SendNotificationController());

//     send_notify.sendNotifications(
//         fcmToken: send_notify.token, title: "eeee", body: "eeee", userId: "1");