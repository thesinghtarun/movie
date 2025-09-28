
import 'package:flutter/material.dart';

class DetailsMobileWidget extends StatelessWidget {
  const DetailsMobileWidget({
    super.key,
    required this.height,
    required this.width,
    required this.poster,
    required this.title,
    required this.releaseDate,
    required this.description,
  });

  final double height;
  final double width;
  final String poster;
  final String title;
  final String releaseDate;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/w500$poster",
            height: height,
            width: width,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          Text(
            releaseDate,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: width,
            height: 46,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 28,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Play",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                  Text(
                    "WishList",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.local_movies_outlined,
                      color: Colors.white, size: 28),
                  Text(
                    "Trailer",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.download, color: Colors.white, size: 28),
                  Text(
                    "Download",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
