import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
    return CarouselSlider(
        items: imgList
            .map((item) => Center(
                child: Image.asset(item, fit: BoxFit.cover, width: 80.w)))
            .toList(),
        options: CarouselOptions(
            autoPlay: true, aspectRatio: 2.0, enlargeCenterPage: true));
  }
}
