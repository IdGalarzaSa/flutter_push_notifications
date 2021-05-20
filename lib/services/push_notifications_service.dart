import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifications {
  // Creamos una instancia
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? token;

  // background
  static Future _backgroundHandler(RemoteMessage message) async {
    print('onBackground message: ${message.messageId}');
  }

  //
  static Future _onMessageHandler(RemoteMessage message) async {
    print('onBackground message: ${message.messageId}');
  }

  // foreground
  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onBackground message: ${message.messageId}');
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
}
