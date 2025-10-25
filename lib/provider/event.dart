import 'package:flutter/material.dart';

class Event {
  final String id;
  final String title;
  final String image;
  final String price;
  final String category;
  final String description;
  final DateTime eventTime;
  final DateTime eventDate;
  final String location;
  final isFavorite;

  Event({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.eventTime,
    required this.eventDate,
    required this.location,
    this.isFavorite = false,
  });
}

class Events with ChangeNotifier {
  final List<Event> _allEvent = [
    Event(
      id: '1', 
      title: 'Lagos Live Music Fest', 
      image: 'assets/images/music.png', 
      price: '15000.0', 
      description: 'Experience the best of Afrobeat and live performances from top artists in Nigeria.',
      category: 'Music',
      eventTime: DateTime(2025, 11, 10), 
      eventDate: DateTime(2025, 11, 10, 19, 00), 
      location: 'Eko Convention Center, Lagos'
    ),
    Event(
      id: '2', 
      title: 'Outdoor Cinema Night', 
      image: 'assets/images/movie.png', 
      price: '5000.0', 
      description: 'Join us for an open-air cinema experience featuring the latest blockbuster movies under the stars.', 
      category: 'Movie', 
      eventTime: DateTime(2025, 11, 12), 
      eventDate: DateTime(2025, 11, 12, 20, 00), 
      location: 'Freedom Park, Lagos Island'
    ),
    Event(
      id: '3', 
      title: 'Lagos Marathon 2025', 
      image: 'assets/images/sports.png', 
      price: '2000.0', 
      description: 'Get ready for the annual Lagos marathon! Run, cheer, and experience the city in a whole new way.', 
      category: 'Sports', 
      eventTime: DateTime(2025, 12, 5), 
      eventDate: DateTime(2025, 12, 5, 7, 00), 
      location: 'National Stadium, Surulere'
    ),
    Event(
      id: '4', 
      title: 'Taste of Lagos Food Festival', 
      image: 'assets/images/food.png', 
      price: '10000.0', 
      description: 'A weekend of food, fun, and culture — enjoy delicious meals from over 50 top chefs and vendors.', 
      category: 'Food', 
      eventTime: DateTime(2025, 11, 25), 
      eventDate: DateTime(2025, 11, 25, 12, 0), 
      location: 'Landmark Beach, Lagos'
    ),
    Event(
      id: '5', 
      title: 'Taste of Lagos Lifestyle Festival', 
      image: 'assets/images/event.png', 
      price: '10000.0', 
      description: 'A weekend of food, fun, and culture — enjoy delicious meals from over 50 top chefs and vendors.', 
      category: 'Lifestyle', 
      eventTime: DateTime(2025, 11, 25), 
      eventDate: DateTime(2025, 11, 25, 12, 0), 
      location: 'Banana Island, Lagos'
    )
  ];

  List<Event> _filteredEvents = [];

  Event findById (String id) {
    return _allEvent.firstWhere((Event) => Event.id == id);
  }

  List<Event> get allEvent {
    if (_filteredEvents.isNotEmpty) {
      return [..._filteredEvents];
    }
    return [..._allEvent];
  }

  void filterBy(String category) {
    if (category == 'All') {
      _filteredEvents = []; 
    } else {
      _filteredEvents = _allEvent.where((event) => event.category == category).toList();
    }
    notifyListeners();
  }

  void searchEvent(String query) {
    if (query.isEmpty) {
      _filteredEvents = [];
    } else {
      _filteredEvents = _allEvent.where((event) {
        final titleLower = event.title.toLowerCase();
        final locationLower = event.location.toString();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower) || locationLower.contains(searchLower);
      }).toList();
    }
    notifyListeners();
  }

  void resetFilter() {
    _filteredEvents = [];
    notifyListeners();
  }

  List<Event> get events {
    return _filteredEvents.isEmpty ? _allEvent : _filteredEvents;
  }
}
