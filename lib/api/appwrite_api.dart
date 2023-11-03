import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:push_notification_app/constants.dart';

enum AppState {
  init,
  loading,
  loaded,
  error,
}

class AppwriteApi with ChangeNotifier {
  final Client _client;

  AppState _appState = AppState.init;
  AppState get appState => _appState;
  setterAppstate(value) {
    _appState = value;
    notifyListeners();
  }

  AppwriteApi()
      : _client = Client()
          ..setEndpoint("https://cloud.appwrite.io/v1")
          ..setProject("6514df63e75857c69464");

  Future sendToDatabase(String token) async {
    try {
      setterAppstate(AppState.loading);
      await Future.delayed(const Duration(seconds: 3), () async {
        final databases = Databases(_client);
        await databases.createDocument(
            databaseId: Appconstants.databaseId,
            collectionId: Appconstants.collectionId,
            documentId: ID.unique(),
            data: {
              "push_notification_token": token,
            });
      });
      setterAppstate(AppState.loaded);

      await Future.delayed(const Duration(seconds: 3), () {
        setterAppstate(AppState.init);
      });
    } catch (e) {
      print(e);
      setterAppstate(AppState.error);
    }
  }
}
