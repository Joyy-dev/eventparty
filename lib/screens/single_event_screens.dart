import 'package:eventparty/provider/event.dart';
import 'package:eventparty/widget/event_botton.dart';
import 'package:eventparty/widget/gallery_slide.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SingleEventScreens extends StatelessWidget {
  final String eventId;
  const SingleEventScreens({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final singleEventProvider = Provider.of<Events>(context);
    final singleEvent = singleEventProvider.findById(eventId);
    final size = MediaQuery.sizeOf(context);
    final horizontalPadding = size.width > 1000 ? size.width * 0.1 : 16.0;
    return Scaffold(
      bottomNavigationBar: EventBotton(),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Image.asset(singleEvent.image),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: horizontalPadding),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                    icon: Icon(Icons.arrow_back)
                  ),
                )
              ] ,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    singleEvent.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_pin, color: Color(0xFFFF5833),),
                              SizedBox(width: 5,),
                              Text(
                                singleEvent.location,
                              ),
                            ],
                         ),
                         SizedBox(height: 7,),
                         Row(
                            children: [
                              Icon(Icons.timer_outlined, color: Color(0xFFFF5833),),
                              SizedBox(width: 5,),
                              Text(
                                DateFormat('h:mm a').format(singleEvent.eventTime)
                              ),
                            ],
                          ),
                        ],
                      ), 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.event_available_outlined, color: Color(0xFFFF5833),),
                              SizedBox(width: 5,),
                              Text(
                                DateFormat('d MMM y').format(singleEvent.eventDate)
                              )
                            ],
                          ),
                          SizedBox(height: 7,),
                          Row(
                            children: [
                              Icon(Icons.price_change_outlined, color: Color(0xFFFF5833),),
                              SizedBox(width: 5,),
                              Text(
                               '\$${singleEvent.price}'
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Event Overview',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    singleEvent.description,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey
                    ),
                  ),
                  SizedBox(height: 20,),
                  GallerySlide(),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFF5833),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 172, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 17
                      )
                    ),
                    child: Text('JOIN')
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}