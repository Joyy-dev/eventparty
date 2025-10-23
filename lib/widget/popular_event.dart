import 'package:eventparty/provider/event.dart';
import 'package:eventparty/screens/event_detail_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PopularEvent extends StatelessWidget {
  const PopularEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final popularProvider = Provider.of<Events>(context);
    final popularEvent = popularProvider.allEvent;

    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: popularEvent.length,
        itemBuilder: (context, index) {
          final popularList = popularEvent[index];
          return SizedBox(
            width: double.infinity,
            height: 115,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        height: 95,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(popularList.image)
                          )
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              popularList.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              DateFormat('d, MMM, h:mm a').format(popularList.eventDate),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14
                              ),
                            ),
                            Text(
                              popularList.location,
                              softWrap: true,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => EventDetailScreens(id: popularList.id)
                      )
                    );
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF5833),
                    foregroundColor: Colors.white
                  ),
                  child: Text(
                    'JOIN'
                  )
                )
              ],
            ),
            // child: ListTile(
            //   leading: ClipRRect(
            //     child: Image(
            //       image: AssetImage(popularList.image),
            //       fit: BoxFit.cover,
            //       width: 80,
            //     ),
            //   ),
            //   title: Text(
            //     popularList.title,
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 17
            //     ),
            //   ),
            //   subtitle: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         DateFormat('d MMM, h:mm a').format(popularList.eventDate),
            //         style: TextStyle(
            //           color: Colors.grey,
            //           fontSize: 14
            //         ),
            //       ),
            //       Text(
            //         popularList.location,
            //         style: TextStyle(
            //           color: Colors.grey,
            //           fontSize: 15
            //         ),
            //       )
            //     ],
            //   ),
            //   trailing: ElevatedButton(
            //     onPressed: () {}, 
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Color(0xFFFF5833),
            //       foregroundColor: Colors.white,
            //       textStyle: TextStyle(
            //         fontWeight: FontWeight.bold,
            //         fontSize: 17,
            //       )
            //     ),
            //     child: Text(
            //       'JOIN'
            //     )
            //   ),
            // ),
          );
        },
      ),
    );
  }
}