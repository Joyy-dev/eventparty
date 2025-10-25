import 'dart:async';
import 'package:eventparty/provider/party.dart';
import 'package:intl/intl.dart';

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
    Color(0xFFFFF4F2),
    Color(0xFFE3F2FD), 
    Color(0xFFFFEBEE), 
  ];

  List<List<Party>> get partyGrid {
    final eventProvider = Provider.of<Parties>(context);
    final partySlide = eventProvider.partyList;

    List<List<Party>> partyHero = [];
    for (int i = 0; i < partySlide.length; i += 1) {
      partyHero.add(partySlide.skip(i).skip(0).take(1).toList());
    }
    return partyHero;
  }


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer) {
      if (_pageController.hasClients) {
        int nextpage = ((_pageController.page ?? 0).round() + 1) % 3;
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

   double getViewportFraction(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width > 1000) return 0.33; // desktop: 3 items
    if (width > 700) return 0.5;   // tablet: 2 items
    return 0.99;                    // mobile: 1 item
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.sizeOf(context);
    final viewportFraction = getViewportFraction(context);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1550),
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          controller: PageController(viewportFraction: viewportFraction),
          itemCount: partyGrid.length * 1000,
          itemBuilder: (context, index) {
            final carouselslide = partyGrid[index % partyGrid.length];
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        events.partyImage,
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('d').format(events.partyDate),
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            ),
                            Text(
                              DateFormat('MMM y').format(events.partyTime)
                            ),
                            SizedBox(height: 10,),
                            Text(
                              events.partyTitle,
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.location_pin, color: Colors.grey,),
                                Flexible(
                                  child: Text(
                                    events.partyLocation,
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
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}