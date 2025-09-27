import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class UpperSliderWidget extends StatelessWidget {
  const UpperSliderWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: CarouselSlider.builder(
      itemCount: 10,
      options: CarouselOptions(
          height: height * .45,
          autoPlay: true,
          scrollPhysics: const BouncingScrollPhysics(),
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 5)),
      itemBuilder: (context, index, realIndex) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text(index.toString())),
        ),
      ),
    ));
  }
}
