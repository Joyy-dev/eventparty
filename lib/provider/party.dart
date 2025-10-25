import 'package:flutter/material.dart';

class Party {
  final String partyId;
  final String partyTitle;
  final String partyImage;
  final double partyPrice;
  final DateTime partyDate;
  final DateTime partyTime;
  final String partyLocation;
  final String description;

  Party ({
    required this.partyId,
    required this.partyTitle,
    required this.partyImage,
    required this.partyPrice,
    required this.partyDate,
    required this.partyTime,
    required this.partyLocation,
    required this.description
  });
}

class Parties with ChangeNotifier {
  final List<Party> _allParty = [
    Party(
      partyId: '1', 
      partyTitle: 'Neon Nights: Glow in the Dark Experience', 
      partyImage: 'assets/images/neon.png', 
      partyPrice: 450, 
      partyDate: DateTime(2025, 11, 15), 
      partyTime: DateTime(2025, 11, 15, 20, 00), 
      partyLocation: 'Electric Avenue Club, Los Angeles, CA', 
      description: 'Step into a world of glowing lights and pulsating beats! Dance the night away under UV lights with neon body paint, EDM DJs, and glowing cocktails.'
    ),
    Party(
      partyId: '2', 
      partyTitle: 'Retro Disco Fever: Back to the 80s', 
      partyImage: 'assets/images/disco.png', 
      partyPrice: 250, 
      partyDate: DateTime(2025, 12, 25), 
      partyTime: DateTime(2025, 12, 25, 19, 00), 
      partyLocation: 'The Groove Lounge, New York, NY', 
      description: 'Relive the disco era with funky lights, mirror balls, and classic 80s hits. Dress in your best retro outfit and show off your dance moves!'
    ),
    Party(
      partyId: '3', 
      partyTitle: 'Beach Bash Bonanza', 
      partyImage: 'assets/images/beach.png', 
      partyPrice: 600, 
      partyDate: DateTime(2025, 07, 20), 
      partyTime: DateTime(2025, 07, 20, 17, 00), 
      partyLocation: 'Sunset Shores, Miami, FL', 
      description: 'A tropical celebration with live DJs, bonfires, beach games, and tropical drinks. Bring your flip-flops and get ready for a night of sun, sand, and sound!'
    ),
    Party(
      partyId: '4', 
      partyTitle: 'Midnight Masquerade Gala', 
      partyImage: 'assets/images/masquerade.png', 
      partyPrice: 800, 
      partyDate: DateTime(2025, 12, 31), 
      partyTime: DateTime(2025, 12, 31, 21, 00), 
      partyLocation: 'The Grand Ballroom, Chicago, I', 
      description: 'Ring in the New Year in style! An elegant night of mystery and glamour with live music, champagne toasts, and a midnight mask reveal.'
    ),
    Party(
      partyId: '5', 
      partyTitle: 'Gamer’s Paradise: LAN & Arcade Night', 
      partyImage: 'assets/images/gamer.png', 
      partyPrice: 250, 
      partyDate: DateTime(2025, 11, 02), 
      partyTime: DateTime(2025, 11, 02, 18, 00), 
      partyLocation: 'Pixel Playhouse, Austin, TX', 
      description: 'Whether you’re a console, PC, or arcade gamer—this night is for you! Enjoy multiplayer tournaments, VR zones, and unlimited arcade tokens.'
    )
  ];

  List<Party> _filteredParty = [];

  void _searchParty (String query) {
    if (query.isEmpty) {
      _filteredParty = [];
    } else {
      _filteredParty =_allParty.where((party) {
        final titleLower = party.partyTitle.toLowerCase();
        final searchLocation = party.partyLocation.toString();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower) || searchLocation.contains(searchLower);
      }).toList();
    }
    notifyListeners();
  }

  List<Party> get partyList {
    return [..._allParty];
  }

  Party findById (String id) {
    return _allParty.firstWhere((Party) => Party.partyId == Party.partyId);
  }
}