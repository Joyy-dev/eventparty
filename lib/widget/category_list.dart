import 'package:eventparty/provider/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<Events>(context);
    final Categories = ['All', ...{
      ...categoryProvider.allEvent.map((events) => events.category)
    }].toList();

    return SizedBox(
      height: 60,
      child: ListView.builder(
        itemCount: Categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          bool isSelected = _selectedIndex == index;
          final event = Categories[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
              if (event == 'All') {
                categoryProvider.resetFilter();
              } else {
                categoryProvider.filterBy(event);
              } 
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isSelected ? Color(0xFFFF5833) : Colors.white
              ),
              child: Center(
                child: Text(
                  event,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16
                  ),
                ),
              ),
            ),
          );
        },
        ),
    );
  }
}