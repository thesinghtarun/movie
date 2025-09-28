import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
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
          height: height,
          autoPlay: true,
          scrollPhysics: const BouncingScrollPhysics(),
          viewportFraction: 1,
          autoPlayInterval: const Duration(seconds: 5)),
      itemBuilder: (context, index, realIndex) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 120,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //movie image
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.redAccent),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Movie Name:"), Text("(2025)")],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    ));
  }
}
