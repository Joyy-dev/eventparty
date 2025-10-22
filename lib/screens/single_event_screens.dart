import 'package:eventparty/provider/event.dart';
import 'package:eventparty/widget/event_botton.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class SingleEventScreens extends StatelessWidget {
  final String eventId;
  const SingleEventScreens({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final singleEventProvider = Provider.of<Events>(context);
    final singleEvent = singleEventProvider.findById(eventId);
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: EventBotton(),

      body: ListView(
        children: [
          Image.asset(singleEvent.image)
        ],
      ),
    );
  }
}