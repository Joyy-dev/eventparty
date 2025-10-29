import 'package:eventparty/widget/category_list.dart';
import 'package:eventparty/widget/event_botton.dart';
import 'package:eventparty/widget/event_drawer.dart';
import 'package:eventparty/widget/event_list.dart';
import 'package:eventparty/widget/event_search.dart';
//import 'package:eventparty/widget/profile_dropdown.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final horizontalPadding = size.width > 1000 ? size.width * 0.1 : 16.0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home'
        ),
        actions: [
          //ProfileDropdown()
        ],
      ),
      bottomNavigationBar: EventBotton(),
      drawer: EventDrawer(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover amazing events',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
                EventSearch(),
                SizedBox(height: 15,),
                CategoryList(),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Events For You',
                      style: TextStyle(
                        fontSize: 17
                      ),
                    ),
                    Text(
                      'View More'
                    )
                  ],
                ),
                SizedBox(height: 15,),
                EventList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}