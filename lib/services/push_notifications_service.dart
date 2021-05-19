import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifications {
  // Creamos una instancia
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializePushNotifications() async {
    // Inicializamos los servicios de firebase
    await Firebase.initializeApp();

    token = await firebaseMessaging.getToken();
    print(token);
  }
}
