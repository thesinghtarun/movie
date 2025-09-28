import 'package:flutter/material.dart';
import 'package:moviefinder/mobile/mobile_home_screen.dart';
import 'package:moviefinder/tab/tab_home_screen.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabLayout;
  const ResponsiveLayout(
      {super.key, required this.mobileLayout, required this.tabLayout});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobileHomeScreen();
        } else {
          return const TabHomeScreen();
        }
      },
    );
  }
}
