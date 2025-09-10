import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:movie_mate/res/colors.dart';
import 'package:movie_mate/res/style.dart';
import 'package:movie_mate/ui/home/bind/home_bind.dart';
import 'package:get/get.dart';
import 'package:movie_mate/ui/home/view/more.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final double bannerHeight = context.cHeight * 0.4;
    const double carouselOverlap = 110.0;
    const double carouselHeight = 240.0;

    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    FirstPart(),
                    const SizedBox(height: carouselHeight - carouselOverlap - 45),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trending Movies',
                          style: customStyle(16, Colors.white, FontWeight.bold),
                        ),
                        TrendingMovieGrid(),
                        // Text(
                        //   'Best Movies',
                        //   style: customStyle(16, Colors.white, FontWeight.bold),
                        // ).cPadOnly(t: 15),
                        // TrendingMovieGrid().cPadOnly(t: 15),
                      ],
                    ).cPadSymmetric(h: 20,v: 20),
                  ],
                ),

                Positioned(
                  top: bannerHeight - carouselOverlap,
                  left: 0,
                  right: 0,
                  child: CarouselExample(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}