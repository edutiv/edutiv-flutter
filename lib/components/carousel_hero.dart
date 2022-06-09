import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselHero extends StatelessWidget {
  const CarouselHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 130.0,
        autoPlay: true,
      ),
      items: [
        GestureDetector(
          onTap: () {},
          child: Card(
            child: Image.network(
              'https://picsum.photos/200/20',
              fit: BoxFit.contain,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            child: Image.network(
              'https://picsum.photos/200/20',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
