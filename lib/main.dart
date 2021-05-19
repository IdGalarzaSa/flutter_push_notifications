import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/screens/home_screen.dart';
import 'package:flutter_push_notifications/screens/message_screen.dart';
import 'package:flutter_push_notifications/services/push_notifications_service.dart';

void main() async {
  /*
  Este metodo nos asegura qun contexto que despues podemos disponert en el FirebaseMessaging.
  Este metodo es necesario para obtener un contexto de la app, para que sea utilizado por firebase_messaging.
  */
  WidgetsFlutterBinding();

  // La instancia de firebase que hace uso del contexto creará un token.
  await PushNotifications.initializePushNotifications();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'message': (_) => MessageScreen(),
      },
    );
  }
}
