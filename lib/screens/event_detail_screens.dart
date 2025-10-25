import 'package:eventparty/provider/event.dart';
import 'package:eventparty/widget/event_scroll.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class EventDetailScreens extends StatelessWidget {
  final String id;
  const EventDetailScreens({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final detailProvider = Provider.of<Events>(context);
    final eventDetail = detailProvider.findById(id);
    final size = MediaQuery.sizeOf(context);
    final horizontalPadding = size.width > 1000 ? size.width * 0.1 : 16.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Event Details'
        ),
        actions: [
          Icon(Icons.more_vert_outlined)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Color(0xFFFF5833)
                )
              ),
              child: Icon(Icons.favorite_border_outlined, color: Color(0xFFFF5833),)
            ),
            SizedBox(width: 9,),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF5833),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14)
                ),
                child: Text(
                  'JOIN'
                )
              ),
            )
          ],
        ),
      ),

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: horizontalPadding),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          eventDetail.image,
                          fit: BoxFit.cover,
                          width: 190,
                          height: 270,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 60, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    DateFormat('d').format(eventDetail.eventDate),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15
                                    ),
                                  ),
                                  Text(
                                    DateFormat('MMM').format(eventDetail.eventDate),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text(
                                eventDetail.title,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Icon(Icons.location_pin, color: Colors.grey,),
                                  Expanded(
                                    child: Text(
                                      eventDetail.location,
                                      softWrap: true,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),  
                ],
              ),
              EventScroll(id: eventDetail.id,)
            ]
          ),
        ),
      ),
    );
  }
}