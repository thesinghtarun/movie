import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moviefinder/controller/app_controller.dart';

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
    return Consumer<AppController>(
      builder: (context, value, child) {
        final movies = value.nowPlayingMoviesData;

        if (movies == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (screenWidth < 600) {
          // Mobile layout (horizontal scroll)
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: movie["poster_path"] != null
                          ? DecorationImage(
                              image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${movie["poster_path"]}",
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                      color: Colors.grey,
                    ),
                    child: Stack(
                      children: [
                        // Title at top with black outline effect
                        Positioned(
                          top: 8,
                          left: 8,
                          right: 8,
                          child: Stack(
                            children: [
                              // Black border (behind)
                              Text(
                                movie["original_title"] ?? "Loading...",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // White front text
                              Text(
                                movie["original_title"] ?? "Loading...",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          // Tablet/Desktop layout (two per row)
          return Expanded(
            child: ListView.builder(
              itemCount: (movies.length / 2).ceil(),
              itemBuilder: (context, index) {
                final leftIndex = index * 2;
                final rightIndex = leftIndex + 1;

                Widget buildMovieItem(int idx) {
                  if (idx >= movies.length) return const SizedBox.shrink();
                  final movie = movies[idx];
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 8),
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: movie["poster_path"] != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500${movie["poster_path"]}",
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          color: Colors.grey,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 8,
                              left: 8,
                              right: 8,
                              child: Stack(
                                children: [
                                  Text(
                                    movie["original_title"] ?? "Loading...",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Container(
                                    color: Colors.black45,
                                    child: Text(
                                      movie["title"] ?? "Loading...",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return Row(
                  children: [
                    buildMovieItem(leftIndex),
                    const SizedBox(width: 10),
                    buildMovieItem(rightIndex),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
