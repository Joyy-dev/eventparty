import 'package:eventparty/firebase_options.dart';
import 'package:eventparty/provider/event.dart';
import 'package:eventparty/provider/party.dart';
import 'package:eventparty/screens/event_screens.dart';
//import 'package:eventparty/screens/home_screens.dart';
import 'package:eventparty/screens/welcome_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return Events();
          }
        ),
        ChangeNotifierProvider(
          create: (context) {
            return Parties();
          }
        )
      ],
        child: MaterialApp(
          title: 'Event Party App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Color(0xFFF2F2F2)
          ),
          home: WelcomeScreens(),
          routes: {
            EventScreens.routeName: (context) => EventScreens(),
            WelcomeScreens.rounteName: (context) => WelcomeScreens()
          },
        )
      );
  }
}
