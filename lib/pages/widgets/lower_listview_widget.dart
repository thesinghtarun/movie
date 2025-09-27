import 'package:flutter/material.dart';

class LowerListViewWidget extends StatelessWidget {
  const LowerListViewWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            width: width * .4,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text(index.toString())),
          ),
        ),
      ),
    );
  }
}
