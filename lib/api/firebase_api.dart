import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:push_notification_app/main.dart';

class FirebaseApi with ChangeNotifier {
  String? _fcmToken;
  String? get fcmToken => _fcmToken;

  // FirebaseMessaging instance
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    try {
      await _firebaseMessaging.requestPermission();
      _fcmToken = await _firebaseMessaging.getToken();
    } catch (e) {
      print(e);
    } finally {
      initPushNotification();
    }
    notifyListeners();
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
