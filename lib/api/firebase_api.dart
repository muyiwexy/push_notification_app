import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notification_app/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Token:$fcmToken');
    initPushNotification();
  }

  void handleBackground(RemoteMessage? message) async {
    if (message == null) return;
    navigatorKey.currentState
        ?.pushNamed('/notification_screen', arguments: message);
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleBackground);
    FirebaseMessaging.onMessageOpenedApp.listen(handleBackground);
  }
}


  // void makePostRequest() async {
  //   final url = Uri.parse("https://6537f274c9b671625589.appwrite.global/");

  //   final Map<String, dynamic> requestBody = {
  //     'deviceToken':
  //         'coVTnoAdTF-sR0XNuRBELS:APA91bEKuw3K3zv-7Qb_ZRmZMXCtO32JYx0TE-ppPcDcbG-oXNP5rlST7MyGKR43IoEoIqo2ewr2-KhaQYw31teeU6q3VBXdofcIFfm4RuoxsntsbNCi6vCxJeGpFhVPZ05fLtUS-waz',
  //     'message': {
  //       'title': 'Notification Title',
  //       'body': 'Notification Body',
  //     },
  //   };

  //   final response = await http.post(
  //     url,
  //     body: jsonEncode(requestBody),
  //   );

  //   if (response.statusCode == 200) {
  //     // Request was successful, you can handle the response here
  //     print("Response: ${response.body}");
  //   } else {
  //     // Request failed, handle the error here
  //     print("Request failed with status: ${response.statusCode}");
  //     print("Response: ${response.body}");
  //   }
  // }