import 'package:eventparty/provider/party.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreens extends StatelessWidget {
  final String partyId;
  const FavoriteScreens({super.key, required this.partyId});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<Parties>(context);
    final favoriteDetails = favoriteProvider.findById(partyId);
    final size = MediaQuery.sizeOf(context);
    final horizontalPadding = size.width > 1000 ? size.width * 0.1 : 16.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Details'
        ),
        actions: [
          Icon(Icons.favorite_outline_outlined)
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFF5833),
            foregroundColor: Colors.white,
            textStyle: TextStyle(
              fontSize: 17
            )
          ),
          child: Text(
            'JOIN'
          )
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  favoriteDetails.partyTitle,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 20,),
                Image.asset(
                  favoriteDetails.partyImage
                ),
                SizedBox(height: 15,),
                Text(
                  'Party Details',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Stack(
                          children: List.generate(4, (index){
                            return Positioned(
                              left: index * 20,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundImage: AssetImage('assets/images/music.png'),
                              )
                            );
                          }),
                        ),
                      ),
                      Text(
                        'Pelican & 24 friends join this event',
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  favoriteDetails.description,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 17
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}