import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviefinder/details_page.dart';
import 'package:provider/provider.dart';

import '../controller/app_controller.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, value, child) {
        final movies = value.popularMoviesdata;

        if (movies == null) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue[50]),
            height: height,
            child: const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator(), Text("Loading")],
            )),
          );
        }

        if (movies.isEmpty) {
          return SizedBox(
            height: height,
            child: const Center(child: Text("No movies found")),
          );
        }

        return CarouselSlider.builder(
          itemCount: movies.length,
          options: CarouselOptions(
            height: height,
            autoPlay: true,
            scrollPhysics: const BouncingScrollPhysics(),
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 5),
          ),
          itemBuilder: (context, index, realIndex) {
            final movie = movies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DeatilsPage(
                              title: movie["title"],
                              poster: movie["poster_path"],
                              description: movie["overview"],
                              releaseDate: movie["release_date"],
                            ))),
                child: Container(
                  decoration: BoxDecoration(
                    image: movie["poster_path"] != null
                        ? DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500${movie["backdrop_path"]}",
                            ),
                            fit: BoxFit.fill,
                          )
                        : null,
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 120,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Movie inner image container
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.redAccent,
                                image: movie["poster_path"] != null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w500${movie["poster_path"]}",
                                        ),
                                        fit: BoxFit.fill,
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.black,
                                    child: Text(
                                      movie["title"] ?? "Loading...",
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    color: Colors.black,
                                    child: Text(
                                      movie["release_date"] ?? "00-00-0000",
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
