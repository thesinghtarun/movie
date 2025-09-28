import 'package:flutter/material.dart';

class ListViewMobileAndTabWidget extends StatelessWidget {
  const ListViewMobileAndTabWidget({
    super.key,
    required this.width,
    required this.screenWidth,
  });

  final double width;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    if (screenWidth < 600) {
      //Mobile lower layout
      return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text(index.toString())),
            ),
          ),
        ),
      );
    }
    //Tab side layout
    else {
      return Expanded(
        child: ListView.builder(
          itemCount: 10, // total rows (20 items / 2 per row)
          itemBuilder: (context, index) {
            final leftItem = index * 2 + 1;
            final rightItem = index * 2 + 2;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Left container
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Item $leftItem"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Right container
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Item $rightItem"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}