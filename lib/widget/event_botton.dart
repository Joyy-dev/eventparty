import 'package:eventparty/screens/event_screens.dart';
import 'package:eventparty/screens/home_screens.dart';
import 'package:flutter/material.dart';

class EventBotton extends StatelessWidget {
  const EventBotton({super.key});

  @override
  Widget build(BuildContext context) {

    return BottomAppBar(
      color: Colors.white,
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => HomeScreens()
                )
              );
            }, 
            icon: Icon(Icons.home, size: 30)
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => EventScreens()
                )
              );
            }, 
            icon: Icon(Icons.event, size: 30,)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.price_change_outlined, size: 30,)
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.person_2_outlined, size: 30,)
          )
        ],
      ),
    );
  }
}