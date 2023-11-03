import 'package:flutter/material.dart';
import 'package:push_notification_app/api/appwrite_api.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Hello World!",
            ),
          ),
          ElevatedButton(
              onPressed: () {
                AppwriteApi().sendToDatabase();
              },
              child: Text("click me"))
        ],
      ),
    );
  }
}
