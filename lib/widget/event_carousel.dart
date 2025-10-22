import 'dart:async';
import 'package:intl/intl.dart';

import 'package:eventparty/provider/event.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class EventCarousel extends StatefulWidget {
  const EventCarousel({super.key});

  @override
  State<EventCarousel> createState() => _EventCarouselState();
}

class _EventCarouselState extends State<EventCarousel> {
  late PageController _pageController;
  Timer? _timer;

  final List<Color> eventColors = [
    Color(0xFFFFF4F2), // Light peach
    Color(0xFFE3F2FD), // Light blue
    Color(0xFFF1F8E9), // Light green
    Color(0xFFFFEBEE), // Light pink
    Color(0xFFFFFDE7), // Light yellow
  ];

  List<List<Event>> get eventGrid {
    final eventProvider = Provider.of<Events>(context);
    final eventSlide = eventProvider.allEvent;

    List<List<Event>> eventhero = [];
    for (int i = 0; i < eventSlide.length; i += 1) {
      eventhero.add(eventSlide.skip(i).take(1).toList());
    }
    return eventhero;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer) {
      if (_pageController.hasClients) {
        int nextpage = ((_pageController.page ?? 0).round() + 1);
        _pageController.animateToPage(
          nextpage, 
          duration: Duration(milliseconds: 200), 
          curve: Curves.easeInOut
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: eventGrid.length * 1000,
        itemBuilder: (context, index) {
          final carouselslide = eventGrid[index % eventGrid.length];
          return GridView.builder(
            itemCount: carouselslide.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              mainAxisExtent: 200,
            ),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final events = carouselslide[index];
              final bgColor = eventColors[index % eventColors.length];
              return Row(
                children: [
                  Container(
                    width: 175,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(events.image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 205,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('d').format(events.eventDate),
                          style: TextStyle(
                            color: Colors.grey
                          ),
                        ),
                        Text(
                          DateFormat('MMM y').format(events.eventDate)
                        ),
                        SizedBox(height: 20,),
                        Text(
                          events.title
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Icon(Icons.location_pin, color: Colors.grey,),
                            Flexible(
                              child: Text(
                                events.location,
                                softWrap: true,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}