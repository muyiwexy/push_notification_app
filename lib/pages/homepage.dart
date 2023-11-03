import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:push_notification_app/api/appwrite_api.dart';
import 'package:push_notification_app/api/firebase_api.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final appwriteApiProvider = Provider.of<AppwriteApi>(context);
    final firebaseApiProvider =
        Provider.of<FirebaseApi>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  appwriteApiProvider
                      .sendToDatabase(firebaseApiProvider.fcmToken!);
                },
                child: Center(
                  child: appwriteApiProvider.appState == AppState.loading
                      ? const CircularProgressIndicator(
                          backgroundColor: Colors.black,
                        )
                      : appwriteApiProvider.appState == AppState.loaded
                          ? const Icon(
                              Icons.check,
                              size: 20,
                            )
                          : const Text("Send token to database"),
                )),
          )
        ],
      ),
    );
  }
}
