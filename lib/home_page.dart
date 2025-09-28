import 'package:flutter/material.dart';
import 'package:moviefinder/mobile/mobile_home_screen.dart';
import 'package:moviefinder/responsive/responsive_layout.dart';
import 'package:moviefinder/tab/tab_home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobileLayout: MobileHomeScreen(), tabLayout: TabHomeScreen());
  }
}