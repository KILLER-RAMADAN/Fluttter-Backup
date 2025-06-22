import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:testapp/core/services/services.dart';

class SendNotificationController extends GetxController {
  MyServices myServices = Get.find();
  late String token = '';
  late String auth_token = '';

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      token = value!;
    });

    super.onInit();
  }

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "spamdetection-cfa53",
      "private_key_id": "ee20c239b8de01e8de881a212fe97f36530a242a",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDSjbk6FmTM7r92\nzrGZObyQVMb+ulKjnu4QX7GPaeViWr8btXALCghXpp8GEZs/Q8mTxaCO3z3nOE9y\nsLZqQcZ11XT0TdmmiOcijiDr1xjjIckDtp629ljceotPEMl1o6+cD3B6IkPfV2Re\nGhfsGr/q/ttsXFtXfGNZS41gVo8a0ejKZU647TVqpI3l8RNh/ICg35ni71UqUOiN\nN+9JIDYe7GYKmImBwnvwX1QKtFfP7eEy5Vf77CkR2yh11PVg+Hck6dm4gu8A5fSn\nYXJUP1zFF1HL3sDglVgiv9DtyHPlacidK0pYAnNGyqAa12NVdjuUg5NDk+JEOGTh\nOnByBU2jAgMBAAECggEAAZDzUUbMXififbhA4vJmgC5ZQpjRN41dmPqVQAtaHPau\n2D5rxHFBKaHAKhPkcz6GV9aPALERbVBiauh8muK9XrAFTDHuDgqTqZKkFQ0HDt13\n+NKZcKP5ej5hHefyj7D1g/QrcoUhux4TzY1lIyj5x3441KAFP+vZc1cYCKDsNJda\nrhWwZ/28Ep7/3sIhVzwPXGp/gD/oDyn4wP0B35xYqdL+J2qsfwgVhya2hHVKr9Xx\nJ/TR2809kDqoy67OicKRWGmnyOhk1d8Eh9Iq2zibkgWdLjM/CGky2hfuIKR+hE86\nvV3OXkX2TU6eZwOjrrcmS1hqtU8fXGkXzcU1SdUpDQKBgQD0N1n/229u9NlXBVAh\ns+0FFxfVxmCDaMlXH8mClSui04JYbW2LavLGjR5FMU0Sk4JFkIeFHz7BH4hn0LN0\nKwqQAtYcLezbQcE7Qe94MM2BobLHmOqZn/HpkvOXhs1TZXV6bBpFIlAuCeS3GHPp\nuLhbiivqmUmpyq0xRMY4fSoJDwKBgQDcto8euKiKJWlIVXgx0QibDvlvLFw+rt8L\ninBVzEImgOU1C8xArCsMsq8/Ejerka+dycOIfhotrF09+JKNx1WPcmvbs/o/t95o\nnHrPqV8PlT+ssUkaCrDyemHFDFUaTSZt6VzHM/KPI7vKODE41c5pXTOozyNFlezD\nTjQfQQbqLQKBgHR/fxhVdlfox1ECwNIDAbse5AjfZCTrtLgx+q+nNzSqTxCdytbq\nArwCj4EUXp7Q7SEALBWt7QK1Zx2W6jQtYBGIuNiic824FVSORI0CQtZm62DZqnf0\nW7M/naIX9RSmXp8yuGloT/VWVNue95RzwMYyKHb1/rTXcT0CgMhrtMSzAoGBAMCj\nsp08zRXue0sAFm1cpmc4FavcCxNG7DSVe2DXa/FRVT0MdBUKcHSfzOd+zgo4mRBe\nVwTeE5lDtQpu1/NZRStz0gIrv0M4B65EzchMa0UdnjrrbgOFy1WITaeAERNovR73\nrNvNUmtu4+wnSYbyzjsWdw1i5cVJiyIYMtQInLFtAoGBAINp227ky3So0ij+hEfw\nX9kQeIfcCv9mTEIuEelZ3szeYW7Chv0/IZhyN2JkVngl7R+zWUqRj5UHsYOCpkOC\nfWKCjJXi0Irptrf0ql/3I1fY2zZ/WFECG1b/YoVxwW/b6Fom+sh1XGsKOoYw8Lbq\nCKPXEh3GeJ7k6Uk+IuA5GzDh\n-----END PRIVATE KEY-----\n",
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
      print("Access Token: ${credentials.accessToken.data}");
      auth_token = credentials.accessToken.data; // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

  Map<String, dynamic> getBody({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    required String page_id,
    required String page_name,
    String? type,
  }) {
    return {
      "message": {
        "token": fcmToken,
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
    required String fcmToken,
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
          fcmToken: fcmToken,
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