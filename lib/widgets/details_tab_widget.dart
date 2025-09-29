import 'package:flutter/material.dart';
import 'package:moviefinder/controller/app_controller.dart';
import 'package:provider/provider.dart';

class DetailsTabWidget extends StatelessWidget {
  const DetailsTabWidget({
    super.key,
    required this.poster,
    required this.width,
    required this.height,
    required this.title,
    required this.releaseDate,
    required this.description,
  });

  final String poster;
  final double width;
  final double height;
  final String title;
  final String releaseDate;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w500$poster",
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              releaseDate,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
        const SizedBox(
          width: 18,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                description,
                overflow: TextOverflow.visible,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                  Icon(Icons.local_movies_outlined,
                      color: Colors.white, size: 28),
                  Icon(Icons.download, color: Colors.white, size: 28),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "WishList",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Trailer",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Download",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Consumer<AppController>(
                builder: (context, value, child) => InkWell(
                  onTap: () => value.urlLauncher(title),
                  child: Container(
                    width: width,
                    height: 46,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
