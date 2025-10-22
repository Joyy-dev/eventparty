import 'package:eventparty/screens/event_screens.dart';
import 'package:eventparty/screens/home_screens.dart';
import 'package:flutter/material.dart';

class EventDrawer extends StatelessWidget {
  const EventDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFF2F2F2),
      elevation: 5,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFFF5833),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/girl.png'),
                  maxRadius: 35,
                ),
                Text(
                  'Lady Diamond',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white
                  ),
                ),
                Text(
                  'lad**********d@gmail.com',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 230, 230, 230),
                    fontSize: 15
                  ),
                )
              ],
            )
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(
                    context
                  ).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreens()
                    )
                  );
                },
                leading: Icon(Icons.home),
                title: Text(
                  'Home'
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(
                    context
                  ).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => EventScreens()
                    )
                  );
                },
                leading: Icon(Icons.event_outlined),
                title: Text(
                  'All Events'
                ),
              ),
              ListTile(
                leading: Icon(Icons.favorite_border_outlined),
                title: Text(
                  'Favorite Events'
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'User Profile'
                )
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Account Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text('Settings'),
              )
            ],
          )
        ],
      ),
    );
  }
}