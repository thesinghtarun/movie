import 'package:flutter/material.dart';

import '../widgets/details_mobile_widget.dart';
import '../widgets/details_tab_widget.dart';

class DeatilsPage extends StatelessWidget {
  const DeatilsPage({
    super.key,
    required this.title,
    required this.poster,
    required this.description,
    required this.releaseDate,
  });

  final String title;
  final String poster;
  final String description;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: width < 600
            ? DetailsMobileWidget(
                height: height * .45,
                width: width,
                poster: poster,
                title: title,
                releaseDate: releaseDate,
                description: description)
            : DetailsTabWidget(
                poster: poster,
                width: width * .56,
                height: height * .84,
                title: title,
                releaseDate: releaseDate,
                description: description),
      ),
    );
  }
}
