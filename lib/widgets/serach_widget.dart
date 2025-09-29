// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:moviefinder/controller/app_controller.dart';
import 'package:provider/provider.dart';

import '../pages/details_page.dart';

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
        color: Colors.grey,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Consumer<AppController>(
        builder: (context, value, child) => TextField(
          controller: searchController,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: "Search",
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (query) async {
            await value.serachMovie(query);

            // Show full-screen dialog
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: "FullScreenDialog",
              transitionDuration: const Duration(milliseconds: 300),
              pageBuilder: (context, anim1, anim2) {
                return Scaffold(
                  backgroundColor: Colors.black.withOpacity(0.9),
                  body: SafeArea(
                    child: Column(
                      children: [
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          title: Text("Results for '$query'"),
                        ),

                        // ✅ Responsive movie grid
                        Expanded(
                          child: Consumer<AppController>(
                            builder: (context, controller, child) {
                              if (controller.serachedMoviesData.isEmpty) {
                                return const Center(
                                  child: Text(
                                    "No results found",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }

                              final screenWidth =
                                  MediaQuery.of(context).size.width;
                              final crossAxisCount = screenWidth > 720 ? 3 : 1;

                              return GridView.builder(
                                padding: const EdgeInsets.all(12),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 2.8, // adjust height/width
                                ),
                                itemCount: controller.serachedMoviesData.length,
                                itemBuilder: (context, index) {
                                  final movie =
                                      controller.serachedMoviesData[index];
                                  return InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DeatilsPage(
                                                  title: movie["title"],
                                                  poster: movie["poster_path"],
                                                  description:
                                                      movie["overview"],
                                                  releaseDate:
                                                      movie["release_date"],
                                                ))),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white10,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          // Poster
                                          if (movie["poster_path"] != null)
                                            Image.network(
                                              "https://image.tmdb.org/t/p/w92${movie["poster_path"]}",
                                              height: 80,
                                            )
                                          else
                                            Container(
                                              height: 80,
                                              width: 60,
                                              color: Colors.grey,
                                              child: const Icon(Icons.movie,
                                                  color: Colors.white),
                                            ),

                                          const SizedBox(width: 12),

                                          // Title + Date
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  movie["title"] ?? "No Title",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 6),
                                                Text(
                                                  movie["release_date"] ?? "",
                                                  style: const TextStyle(
                                                      color: Colors.white70),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              transitionBuilder: (context, anim1, anim2, child) {
                return FadeTransition(
                  opacity: anim1,
                  child: child,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
