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
            elevation: 3,
            child: Image.network(
              'https://picsum.photos/id/156/200/300',
              fit: BoxFit.fill,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Card(
            elevation: 3,
            child: Image.network(
              'https://picsum.photos/id/256/200/300',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
