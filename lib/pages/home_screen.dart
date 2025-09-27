import 'package:flutter/material.dart';

import 'widgets/lower_listview_widget.dart';
import 'widgets/serach_widget.dart';
import 'widgets/upper_slider_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              SerachWidget(height: height, searchController: searchController),
              const SizedBox(
                height: 10,
              ),
              //Carousel slider
              UpperSliderWidget(height: height),
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
              LowerListViewWidget(width: width)
            ],
          ),
        ),
      ),
    );
  }
}
