import 'package:eventparty/provider/event.dart';
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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                children: [
                  Text(
                    eventDetail.description
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