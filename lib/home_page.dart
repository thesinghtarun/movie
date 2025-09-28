import 'package:flutter/material.dart';
import 'package:moviefinder/mobile/mobile_home_screen.dart';
import 'package:moviefinder/responsive/responsive_layout.dart';
import 'package:moviefinder/tab/tab_home_screen.dart';
import 'package:provider/provider.dart';

import 'controller/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      Provider.of<AppController>(context, listen: false).getPopularMovies();
      Provider.of<AppController>(context, listen: false).nowPlayingMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: MobileHomeScreen(), tabLayout: TabHomeScreen());
  }
}
