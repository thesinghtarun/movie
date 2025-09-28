import 'package:flutter/material.dart';

class SerachWidget extends StatelessWidget {
  const SerachWidget({
    super.key,
    required this.height,
    required this.searchController,
  });

  final double height;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(6)),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: "Search"),
          
      ),
    );
  }
}
