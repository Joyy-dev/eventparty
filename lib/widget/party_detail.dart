import 'package:flutter/material.dart';

class PartyDetail extends StatelessWidget {
  const PartyDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          SizedBox(
            width: 105,
            child: Stack(
              children: List.generate(4, (index) {
                return Positioned(
                  left: index * 23,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/images/girl.png'),
                  )
                );
              })
            ),
          ),
          SizedBox(width: 10,),
          Text(
            '+12 participants',
            style: TextStyle(
              color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}