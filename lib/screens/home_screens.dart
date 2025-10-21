import 'package:eventparty/widget/category_list.dart';
import 'package:eventparty/widget/event_drawer.dart';
import 'package:eventparty/widget/event_search.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Home'
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.notifications_none_outlined)
          )
        ],
      ),
      drawer: EventDrawer(),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
        child: Column(
          children: [
            Text(
              'Discover amazing events',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20,),
            EventSearch(),
            SizedBox(height: 15,),
            CategoryList()
          ],
        ),
      ),
    );
  }
}