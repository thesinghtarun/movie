import 'package:flutter/material.dart';

import '../widgets/listview_mobile_tab_widget.dart';
import '../widgets/serach_widget.dart';
import '../widgets/carousel_slider_widegt.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //Search box
              SerachWidget(
                  height: height / 16, searchController: searchController),
              const SizedBox(
                height: 10,
              ),
              //Carousel slider
              CarouselSliderWidget(
                height: height * .45,
              ),
              //
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured Today",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
              ),
              //lower list view(horizontal)
              ListViewMobileAndTabWidget(
                width: width * .4,
                screenWidth: width,
              )
            ],
          ),
        ),
      ),
    );
  }
}
