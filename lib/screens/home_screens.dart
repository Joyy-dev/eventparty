import 'package:eventparty/widget/category_list.dart';
import 'package:eventparty/widget/event_botton.dart';
import 'package:eventparty/widget/event_drawer.dart';
import 'package:eventparty/widget/event_list.dart';
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
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/girl.png'),
          )
        ],
      ),
      bottomNavigationBar: EventBotton(),
      drawer: EventDrawer(),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover amazing events',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              EventSearch(),
              SizedBox(height: 15,),
              CategoryList(),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Events For You',
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                  Text(
                    'View More'
                  )
                ],
              ),
              SizedBox(height: 15,),
              EventList()
            ],
          ),
        ),
      ),
    );
  }
}