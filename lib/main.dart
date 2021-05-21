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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    PushNotifications.messageStream.listen((message) {
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      final SnackBar snackBar = new SnackBar(content: Text('$message'));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      routes: {
        'home': (_) => HomeScreen(),
        'message': (_) => MessageScreen(),
      },
    );
  }
}
