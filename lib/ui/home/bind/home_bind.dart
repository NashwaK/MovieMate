import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:movie_mate/model/MovieListModel.dart';

class HomeBind implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final PageController pageViewController =
  PageController(viewportFraction: 0.5);
  double currentPage = 0;

  @override
  void onInit() {
    pageViewController.addListener(() {
        currentPage = pageViewController.page ?? 0;
        update();
    });
    super.onInit();
  }

  // PageController for the main movie carousel
//   late PageController pageController;
//   // Tracks the current page for the scaling animation
//   final RxDouble currentPage = 0.0.obs;
//
//   // Dummy data for the movie lists
//   final RxList<Movie> bookNowMovies = <Movie>[
//     Movie(title: 'The Home', posterUrl: 'https://i.ebayimg.com/images/g/sLgAAOSw2c5b42im/s-l1600.jpg'),
//     Movie(title: 'Superman', posterUrl: 'https://m.media-amazon.com/images/I/71uL-10mhXL.jpg'),
//     Movie(title: 'Formula 1', posterUrl: 'https://www.themoviedb.org/t/p/original/s25aV3tY30a9u0m0iCV2l3qH22r.jpg'),
//   ].obs;
//
//   final RxList<Movie> trendingMovies = <Movie>[
//     Movie(title: 'Gravity', posterUrl: 'https://m.media-amazon.com/images/I/A1nFk5K5b-L._AC_SL1500_.jpg'),
//     Movie(title: 'The Invisible', posterUrl: 'https://i.pinimg.com/originals/82/c4/cc/82c4cc34a4a159511516094a9740523d.jpg'),
//     Movie(title: 'Big Four', posterUrl: 'https://m.media-amazon.com/images/M/MV5BNTM4ZmNjYmYtNjVjMS00YjVmLWJiMGEtNjMwN2EzN2FmNTE5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg'),
//   ].obs;
//
//   final RxList<Movie> upcomingMovies = <Movie>[
//     Movie(title: 'Jurassic World', posterUrl: 'https://m.media-amazon.com/images/M/MV5BOTAzODEzNDAzMl5BMl5BanBnXkFtZTgwMDU1MTgzNzE@._V1_FMjpg_UX1000_.jpg'),
//     Movie(title: 'Serenity', posterUrl: 'https://m.media-amazon.com/images/I/A1ed25y6LFL._AC_SL1500_.jpg'),
//     Movie(title: 'Downton Abbey', posterUrl: 'https://www.uphe.com/sites/default/files/styles/scale__344w_/public/2021/01/DowntonAbbey_PosterArt.jpg'),
//   ].obs;
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize PageController with a viewport fraction for peeking effect
//     pageController = PageController(viewportFraction: 0.7, initialPage: 1);
//     // Listen to page changes to update the currentPage reactive variable
//     pageController.addListener(() {
//       currentPage.value = pageController.page!;
//     });
//   }
//
//   @override
//   void onClose() {
//     pageController.dispose();
//     super.onClose();
//   }
// }
// class HomeController extends GetxController {
//   static HomeController get to => Get.find();
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
}