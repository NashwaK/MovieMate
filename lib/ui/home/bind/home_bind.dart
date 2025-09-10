import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:movie_mate/model/MovieListModel.dart';
import 'package:movie_mate/utilities/api_provider.dart';

class HomeBind implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  MoviesModelClass?moviesModelClass;

  late PageController pageViewController;
  double currentPage = 1.0;

  @override
  void onInit() {
    super.onInit();
    getMovies();
    pageViewController = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    );

    pageViewController.addListener(() {
      currentPage = pageViewController.page ?? 1.0;
      update();
    });
  }

  Future<void> getMovies() async {
    try {
      // if (AppSession.to.session.read(SessionKeys.TOKEN) == null) {
      //   return;
      // }
      EasyLoading.show();
      10.cDelay(() {
        EasyLoading.dismiss();
      });
      moviesModelClass = await Api.to.getMovieList();
      EasyLoading.dismiss();
      print('model profile ${moviesModelClass?.data?.length}');
      // if (!(moviesModelClass?.success ?? false)) {
      //   EasyLoading.showToast(moviesModelClass?.message ?? '');
      //   // Get.snackbar(walletModel?.message ?? '', '');
      // }
      // dataRefresh = false.obs;
    } catch (ex) {
      // dataRefresh = false.obs;
      EasyLoading.dismiss();
      if (kDebugMode) {
        print('Exception : $ex');
      }
    } finally {
      // dataRefresh = false.obs;
      EasyLoading.dismiss();
      update();
    }
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