import 'package:eventparty/provider/event.dart';
import 'package:eventparty/provider/party.dart';
import 'package:eventparty/screens/event_screens.dart';
import 'package:eventparty/screens/home_screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
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
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Color(0xFFF2F2F2)
          ),
          home: HomeScreens(),
          routes: {
            EventScreens.routeName: (context) => EventScreens()
          },
        )
      );
  }
}
