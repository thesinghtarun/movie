import 'package:flutter/material.dart';
import 'package:moviefinder/details_page.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:moviefinder/controller/app_controller.dart';

class ListViewMobileAndTabWidget extends StatelessWidget {
  const ListViewMobileAndTabWidget({
    super.key,
    required this.width,
    required this.screenWidth,
  });

  final double width;
  final double screenWidth;

  Widget _buildShimmerItem(double height, double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width * .48,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, value, child) {
        final movies = value.nowPlayingMoviesData;

        if (movies == null) {
          // Show shimmer while loading
          if (screenWidth < 600) {
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildShimmerItem(180, width * .45),
                ),
              ),
            );
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: _buildShimmerItem(180, width / 2 - 10),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: _buildShimmerItem(180, width / 2 - 10),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        }

        // Actual movie list when loaded
        if (screenWidth < 600) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: movie["poster_path"] != null
                            ? DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500${movie["poster_path"]}"),
                                fit: BoxFit.fill,
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
                            child: Container(
                              color: Colors.black45,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 6),
                              child: Text(
                                movie["title"] ?? "Loading...",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
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
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: movie["poster_path"] != null
                                ? DecorationImage(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/w500${movie["poster_path"]}"),
                                    fit: BoxFit.fill,
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
                                child: Container(
                                  color: Colors.black45,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 6),
                                  child: Text(
                                    movie["title"] ?? "Loading...",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
