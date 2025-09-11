import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:movie_mate/res/colors.dart';
import 'package:movie_mate/res/style.dart';
import 'package:movie_mate/ui/home/bind/home_bind.dart';
import 'package:get/get.dart';
import 'package:movie_mate/ui/home/view/more.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    final double bannerHeight = context.cHeight * 0.4;
    const double carouselOverlap = 110.0;
    const double carouselHeight = 240.0;

    return GetBuilder<HomeController>(
        builder: (logic) {
          return Scaffold(
            backgroundColor: primaryColor,
            body: SmartRefresher(
              controller: _refreshController,
              onRefresh: () async {
                logic.refreshMovies();
                _refreshController.refreshCompleted();
                logic.update();
              },
              enablePullDown: true,
              header: const WaterDropHeader(
                waterDropColor: Colors.white,
                complete: Icon(Icons.check, color: Colors.white),
              ),
              child: CustomScrollView(
                controller: logic.scrollViewController, // Use the correct controller
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            const FirstPart(),
                            const SizedBox(height: carouselHeight - carouselOverlap - 45),
                            Text(
                              'Trending Movies',
                              style: customStyle(16, Colors.white, FontWeight.bold),
                            ).cPadSymmetric(h: 20, v: 0),
                          ],
                        ),
                        Positioned(
                          top: bannerHeight - carouselOverlap,
                          left: 0,
                          right: 0,
                          child: const CarouselPart(),
                        ),
                      ],
                    ),
                  ),
                  // Use SliverList for the grid to enable proper scrolling
                  SliverToBoxAdapter(
                    child: const TrendingMovieGrid().cPadSymmetric(h: 20, v: 20),
                  ),
                  // Add loading indicator at the bottom
                  SliverToBoxAdapter(
                    child: _buildLoadingIndicator(logic),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Widget _buildLoadingIndicator(HomeController logic) {
    if (logic.isLoading && logic.moviesList.isNotEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        ),
      );
    }
    if (!logic.hasMore && logic.moviesList.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'No more movies to load',
          style: customStyle(14, Colors.white54, FontWeight.normal),
          textAlign: TextAlign.center,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}