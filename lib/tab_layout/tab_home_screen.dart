import 'package:flutter/material.dart';
import 'package:moviefinder/widgets/listview_mobile_tab_widget.dart';
import 'package:moviefinder/widgets/serach_widget.dart';
import 'package:moviefinder/widgets/carousel_slider_widegt.dart';

class TabHomeScreen extends StatefulWidget {
  const TabHomeScreen({super.key});

  @override
  State<TabHomeScreen> createState() => _TabHomeScreenState();
}

class _TabHomeScreenState extends State<TabHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SerachWidget(
              height: height * .06,
              searchController: searchController,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  // Carousel Slider
                  SizedBox(
                    width: width * 0.48,
                    child: CarouselSliderWidget(
                      height: height,
                    ),
                  ),
                  //ListView
                  ListViewMobileAndTabWidget(width: width, screenWidth: width)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
