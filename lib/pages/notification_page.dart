import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Column(
        children: [
          Text('Title: ${message.notification?.title}'),
          Text('body: ${message.notification?.body}'),
          Text('payload: ${message.data}'),
        ],
      ),
    );
  }
}
