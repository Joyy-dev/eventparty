import 'package:flutter/material.dart';

class EventSearch extends StatelessWidget {
  const EventSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}