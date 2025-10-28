import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileDropdown extends StatelessWidget {
  const ProfileDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) async {
        if (value == 'Logout') {
          await FirebaseAuth.instance.signOut();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Logged Out successfully'))
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('selected: $value'))
          );
        }
      },
      itemBuilder: (context) =>
        [
          PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
            )
          ),
          PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.event_available_outlined),
              title: Text('Scheduled Event'),
            )
          ),
          PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
            )
          ),
        ],
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/girl.png'),
        ),
    );
  }
}