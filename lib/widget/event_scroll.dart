import 'package:eventparty/provider/event.dart';
import 'package:eventparty/widget/party_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventScroll extends StatelessWidget {
  final String id;
  const EventScroll({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<Events>(context);
    final eventDetail = eventProvider.findById(id);
    return DraggableScrollableSheet(
      initialChildSize: 0.66,
      maxChildSize: 0.8,
      minChildSize: 0.66,
      builder: (context, scrollController) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35)
          ),
          color: Colors.white,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PartyDetail(),
                  SizedBox(height: 10,),
                  Text(
                    eventDetail.description,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}