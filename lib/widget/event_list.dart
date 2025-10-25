import 'package:eventparty/provider/event.dart';
import 'package:eventparty/screens/event_detail_screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<Events>(context);
    final event = eventProvider.allEvent;

    return event.isEmpty 
    ? Center(child: Text(
      'Oops!!! Check again for new Event',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    )) 
    : SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: event.length,
        itemBuilder: (context, index) {
          final events = event[index];
          return Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0, 3)
                )
              ]
            ),
            child: ListTile(
              leading: Image.asset(
                events.image,
                fit: BoxFit.cover,
                width: 80,
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => EventDetailScreens(id: events.id)
                    )
                  );
                },
                child: Text(
                  events.title
                )
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.grey, size: 15,),
                      SizedBox(width: 5,),
                      Text(
                        DateFormat('d MMM y').format(events.eventDate),
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_pin, color: Colors.grey, size: 15,),
                      SizedBox(width: 5,),
                      Text(
                        events.location,
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },          
      ),
    );
  }
}