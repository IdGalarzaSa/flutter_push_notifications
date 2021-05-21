import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifications {
  // Creamos una instancia
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? token;

  static StreamController<String> _messagestreamController =
      new StreamController.broadcast();

  static Stream<String> get messageStream => _messagestreamController.stream;

  // Background
  static Future _backgroundHandler(RemoteMessage message) async {
    print('_backgroundHandler message: ${message.messageId}');
    _messagestreamController.add(message.data["messageData"] ?? "No ID");
  }

  // Foreground
  static Future _onMessageHandler(RemoteMessage message) async {
    print('_onMessageHandler message: ${message.messageId}');
    _messagestreamController.add(message.data["messageData"] ?? "No ID");
  }

  // Terminated
  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('_onMessageOpenApp message: ${message.messageId}');
    _messagestreamController.add(message.data["messageData"] ?? "No ID");
  }

  static Future initializePushNotifications() async {
    // Inicializamos los servicios de firebase
    await Firebase.initializeApp();

    token = await FirebaseMessaging.instance.getToken();
    print(token);

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }

  static _closeStream() {
    _messagestreamController.close();
  }
}
