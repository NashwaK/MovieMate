import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:movie_mate/res/colors.dart';
import 'package:movie_mate/res/images.dart';
import 'package:movie_mate/res/style.dart';
import 'package:movie_mate/ui/home/bind/home_bind.dart';
import 'package:movie_mate/utilities/app_route.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          height: context.cHeight * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(homeBanner),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Dark overlay (tint)
        Container(
          height: context.cHeight * 0.4,
          width: double.infinity,
          color: Colors.black.withOpacity(0.3),
        ),

        // Bottom gradient fade
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, primaryColor],
              ),
            ),
          ),
        ),

        // Top Content
        Positioned.fill(
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextfieldPart().cExpanded(1),
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.wishList);
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    size: 35,
                    color: Colors.white,
                  ),
                ).cPadOnly(t: 10).cExpanded(0),
              ],
            ).cPadSymmetric(h: 10),
          ),
        ),
      ],
    );
  }
}

class TextfieldPart extends StatelessWidget {
  const TextfieldPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search Movie',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.5)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.25),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
        ),
      ),
    );
  }
}

class OverlayProductsPart extends StatelessWidget {
  const OverlayProductsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return SizedBox(
          height: 240,
          child: PageView.builder(
            controller: logic.pageViewController,
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              // calculate vertical offset (lift the current item up)
              double offset = 0.0;
              if (index == logic.currentPage.floor() ||
                  index == logic.currentPage.ceil()) {
                offset =
                    -20 *
                    (1 - (logic.currentPage - index).abs()).clamp(
                      0.0,
                      1.0,
                    ); // move up to 20px
              }

              return Transform.translate(
                offset: Offset(0, offset),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(homeBanner),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Indiana Johns',
                              style: customStyle(
                                14,
                                Colors.black,
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class TrendingMovieGrid extends StatelessWidget {
  const TrendingMovieGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemCount: logic.moviesModelClass?.data?.length ?? 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, i) {
            var data = logic.moviesModelClass?.data?[i];
            return GestureDetector(
              onTap: () {
                  Get.toNamed(
                  Routes.movieDetails,
                  parameters: {
                    'index': '$i'
                  },
                );
                logic.update();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(data?.posterPath ?? ''),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// class TrendingMovieGrid extends StatelessWidget {
//   const TrendingMovieGrid({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       builder: (logic) {
//         return SizedBox(
//           height: 120,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 10,
//             physics: const BouncingScrollPhysics(),
//             // padding: const EdgeInsets.symmetric(horizontal: 16),
//             itemBuilder: (context, i) {
//               return Container(
//                 width: 190, // fixed width for each item
//                 margin: const EdgeInsets.only(right: 12),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   image: DecorationImage(
//                     image: AssetImage(homeBanner),
//                     fit: BoxFit.cover,
//                   ),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 4,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class CarouselPart extends StatelessWidget {
  const CarouselPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return Center(
          child: CarouselSlider.builder(
            itemCount: logic.moviesModelClass?.data?.length ?? 0,
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            itemBuilder: (context, index, realIndex) {
              var data = logic.moviesModelClass?.data?[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(
                    Routes.movieDetails,
                    parameters: {
                      'index': '$index'
                    },
                  );
                  logic.update();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      children: [
                        // Background image
                        Positioned.fill(
                          child: Image.network(
                            data?.backdropPath ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Bottom text with semi-transparent background
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black.withOpacity(0.6),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              data?.originalTitle ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ).cToCenter,
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
      },
    );
  }
}
