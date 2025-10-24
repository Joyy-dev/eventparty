import 'package:eventparty/provider/party.dart';
import 'package:eventparty/screens/favorite_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class PopularEvent extends StatelessWidget {
  const PopularEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final popularProvider = Provider.of<Parties>(context);
    final popularEvent = popularProvider.partyList;

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
                            image: AssetImage(popularList.partyImage)
                          )
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              popularList.partyTitle,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              DateFormat('d, MMM, h:mm a').format(popularList.partyDate),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14
                              ),
                            ),
                            Text(
                              popularList.partyLocation,
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
                        builder: (context) => FavoriteScreens(partyId: popularList.partyId,)
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
          );
        },
      ),
    );
  }
}