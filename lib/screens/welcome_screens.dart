import 'package:eventparty/screens/home_screens.dart';
import 'package:flutter/material.dart';

class WelcomeScreens extends StatelessWidget {
  static const rounteName = 'Welcome-Screens';
  const WelcomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final horizontalPadding = size.width > 1000 ? 0.1 : 16.0;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: horizontalPadding),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomCenter,
            colors: [
              Color(0xFFFF5833),
              const Color.fromARGB(255, 243, 212, 212),
              Color(0xFFFF5833),
              
            ]
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Eventify',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ), textAlign: TextAlign.center,
            ),
            Text(
              'Event Made Easy',
              style: TextStyle(
                fontSize: 18
              ),
            ),
            SizedBox(height: 70,),
            Text(
              'Eventify makes discovering, organizing, and attending events effortless. Whether you’re planning a corporate conference, a music festival, or a casual meetup, Eventify connects people and experiences in one smart, intuitive platform.',
              style: TextStyle(
                fontSize: 17
              ),
            ),
            SizedBox(height: 70,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => HomeScreens())
                );
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF5833),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}