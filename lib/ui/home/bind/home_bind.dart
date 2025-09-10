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

  late PageController pageViewController;
  double currentPage = 1.0; // start at second item

  @override
  void onInit() {
    super.onInit();
    pageViewController = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    );

    pageViewController.addListener(() {
      currentPage = pageViewController.page ?? 1.0;
      update();
    });
  }
}

// class HomeController extends GetxController {
//   static HomeController get to => Get.find();
//
//   final PageController pageViewController =
//   PageController(viewportFraction: 0.5);
//   double currentPage = 0;
//
//   @override
//   void onInit() {
//     pageViewController.addListener(() {
//         currentPage = pageViewController.page ?? 0;
//         update();
//     });
//     super.onInit();
//   }
// }