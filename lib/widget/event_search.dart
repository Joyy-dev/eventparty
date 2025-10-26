import 'package:eventparty/provider/event.dart';
import 'package:eventparty/provider/party.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventSearch extends StatelessWidget {
  const EventSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search events...',
          prefixIcon: Icon(Icons.search_rounded),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
              style: BorderStyle.solid
            ),
          ),
        ),
        onChanged: (value) {
          Provider.of<Events>(context, listen: false).searchEvent(value);
          Provider.of<Parties>(context, listen: false).searchParty(value);
        },
      ),
    );
  }
}