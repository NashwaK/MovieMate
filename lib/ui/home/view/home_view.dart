import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:movie_mate/res/images.dart';
import 'package:movie_mate/ui/home/bind/home_bind.dart';
import 'package:get/get.dart';
import 'package:movie_mate/ui/home/view/more.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Stack(
        children: [
          // Background Gradient Glow Effect
          Positioned(
            top: -100,
            left: -100,
            child: BackColorLeft()
          ),
          Positioned(
            top: 100,
            right: -150,
            child: BackColorRight()
          ),

          // Main Content Area
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: _buildSearchField(),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildMainBanner(),
                      const SizedBox(height: 24),
                      _buildBookNowCarousel(context),
                      _buildSectionHeader("Trending Movie Near You",TextStyle(color: Colors.black)),
                      _buildTrendingList(context),
                      _buildSectionHeader("Upcoming",TextStyle(color: Colors.black)),
                      _buildUpcomingList(context),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // --- WIDGET BUILDER METHODS ---

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search Movie',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
          prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.5)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildMainBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 220,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                homeBanner,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            // Play Button
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
              ),
            ),
            // Tags at the bottom
            Positioned(
              bottom: 16,
              left: 16,
              child: Row(
                children: [
                  _buildTag("Drama"),
                  const SizedBox(width: 8),
                  _buildTag("12+"),
                  const SizedBox(width: 8),
                  _buildTag("Drama"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Text(
        label,
        // style: GoogleFonts.exo(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildBookNowCarousel(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Obx(
            () => PageView.builder(
          controller: controller.pageController,
          itemCount: controller.bookNowMovies.length,
          itemBuilder: (context, index) {
            double scale = 1.0;
            if (controller.pageController.position.haveDimensions) {
              scale = (1 - (controller.currentPage.value - index).abs() * 0.2).clamp(0.8, 1.0);
            }
            return Transform.scale(
              scale: scale,
              child: _buildBookNowCard(
                imageUrl: homeBanner,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBookNowCard({required String imageUrl}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(imageUrl, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  'Book Now',
                  // style: GoogleFonts.exo(
                  //   color: Colors.white,
                  //   fontWeight: FontWeight.bold,
                  //   fontSize: 16,
                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, top: 24, bottom: 16),
      child: Text(title, style: style),
    );
  }

  Widget _buildTrendingList(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.trendingMovies.length,
        padding: const EdgeInsets.only(left: 24),
        itemBuilder: (context, index) {
          return Container(
            width: 280,
            margin: const EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                homeBanner,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildUpcomingList(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.upcomingMovies.length,
        padding: const EdgeInsets.only(left: 24),
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 16),
            child: _buildBookNowCard(
              imageUrl: homeBanner,
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1B1A21),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white54,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark_border), label: 'My List'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}