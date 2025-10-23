import 'package:eventparty/widget/event_botton.dart';
import 'package:eventparty/widget/event_carousel.dart';
import 'package:eventparty/widget/event_drawer.dart';
import 'package:eventparty/widget/event_search.dart';
import 'package:eventparty/widget/popular_event.dart';
import 'package:flutter/material.dart';

class EventScreens extends StatelessWidget {
  static const routeName = '/event-screens';
  const EventScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Event Home'
        ),
        actions: [
          Icon(Icons.notifications_active_outlined)
        ],
      ),
      bottomNavigationBar: EventBotton(),
      drawer: EventDrawer(),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.grey,),
                  Text(
                    'San Francisco, California',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              EventSearch(),
              SizedBox(height: 20,),
              EventCarousel(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Events',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              PopularEvent()
            ],
          ),
        ),
      ),
    );
  }
}