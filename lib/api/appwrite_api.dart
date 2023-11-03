import 'package:appwrite/appwrite.dart';
import 'package:push_notification_app/constants.dart';

class AppwriteApi {
  final Client _client;

  AppwriteApi()
      : _client = Client()
          ..setEndpoint("https://cloud.appwrite.io/v1")
          ..setProject("6514df63e75857c69464");

  Future sendToDatabase() async {
    try {
      final databases = Databases(_client);
      await databases.createDocument(
          databaseId: Appconstants.databaseId,
          collectionId: Appconstants.collectionId,
          documentId: ID.unique(),
          data: {
            "push_notification_token": "<fcmtoken>",
          });
    } catch (e) {
      print(e);
    }
  }
}


  // void sendNotification() async {
  //   try {
  //     final function = Functions(_client);
  //     final Map<String, dynamic> requestBody = {
  //       'deviceToken':
  //           'coVTnoAdTF-sR0XNuRBELS:APA91bEKuw3K3zv-7Qb_ZRmZMXCtO32JYx0TE-ppPcDcbG-oXNP5rlST7MyGKR43IoEoIqo2ewr2-KhaQYw31teeU6q3VBXdofcIFfm4RuoxsntsbNCi6vCxJeGpFhVPZ05fLtUS-waz',
  //       'message': {
  //         'title': 'Notification Title',
  //         'body': 'Notification Body',
  //       },
  //     };
  //     final result = await function.createExecution(
  //       functionId: "6537f2743b90c9c82bee",
  //       body: jsonEncode(requestBody),
  //       path: '/',
  //       method: 'POST',
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'X-Custom-Header': '123',
  //       },
  //     );

  //     print(result.responseBody);
  //     print(result.responseStatusCode);
  //   } catch (e) {
  //     print(e);
  //   }
  // }