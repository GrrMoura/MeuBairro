import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BoxCarousel extends StatelessWidget {
  BoxCarousel({Key? key}) : super(key: key);

  final List<String> imgList = [
    'assets/images/costureira.jpg',
    'assets/images/hamb.jpg',
    'assets/images/pizza.jpg',
    'assets/images/advocacia.jpg',
    'assets/images/eletricista.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: CarouselSlider(
          items: imgList
              .map((item) => Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 500)))
              .toList(),
          options: CarouselOptions(
              autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: true)),
    );
  }
}
