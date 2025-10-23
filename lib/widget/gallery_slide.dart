import 'package:flutter/material.dart';

class GallerySlide extends StatelessWidget {
  const GallerySlide({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/event.png', 
                height: 140, 
                width: 140,
              ),
            ),
            SizedBox(width: 9,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/music.png', 
                height: 140, 
                width: 140,
              ),
            ),
            SizedBox(width: 9,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/movie.png', 
                height: 140, 
                width: 140,
              ),
            ),
            SizedBox(width: 9,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/sports.png', 
                height: 140, 
                width:140,
              ),
            ),
          ],
        ),
      ),
    );
  }
}