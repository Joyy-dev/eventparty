import 'package:eventparty/provider/event.dart';
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
    return ChangeNotifierProvider(
      create: (context) {
        return Events();
      },
      child: MaterialApp(
        title: 'Event Party App',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: HomeScreens(),
      ),
    );
  }
}
