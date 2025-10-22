import 'package:eventparty/provider/event.dart';
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
          return Container(
            width: double.infinity,
            height: 150,
            child: ListTile(
              leading: Image(
                image: AssetImage(popularList.image),
                fit: BoxFit.cover,
                width: 80,
              ),
              title: Text(
                popularList.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('d MMM, h:mm a').format(popularList.eventDate),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14
                    ),
                  ),
                  Text(
                    popularList.location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15
                    ),
                  )
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF5833),
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  )
                ),
                child: Text(
                  'JOIN'
                )
              ),
            ),
          );
        },
      ),
    );
  }
}