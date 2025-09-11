import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:movie_mate/model/MovieListModel.dart';
import 'package:movie_mate/utilities/api_provider.dart';
import 'package:movie_mate/utilities/com_binding.dart';
import 'package:movie_mate/utilities/session_keys.dart';

class HomeBind implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  MoviesModelClass? moviesModelClass;
  List<Data> moviesList = [];
  int currentPage = 1;
  int perPage = 20;
  bool isLoading = false;
  bool hasMore = true;
  String? nextCursor;

  late PageController pageViewController;
  late ScrollController scrollViewController;
  double currentCarouselPage = 1.0;

  var wishlist = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    getMovies();

    List<int> storedWishlist = AppSession.to.session.read(SessionKeys.FAVOURITE)?.cast<int>() ?? [];
    print('hgfghii==>$storedWishlist');
    wishlist.value = storedWishlist;
    print('wish print itemmmm==>${wishlist.length}');

    // Page controller for carousel
    pageViewController = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    );

    pageViewController.addListener(() {
      currentCarouselPage = pageViewController.page ?? 1.0;
      update();
    });

    // Scroll controller for main content
    scrollViewController = ScrollController();
    scrollViewController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollViewController.position.pixels ==
        scrollViewController.position.maxScrollExtent &&
        !isLoading &&
        hasMore) {
      loadMoreMovies();
    }
  }

  Future<void> getMovies({bool loadMore = false}) async {
    if (isLoading) return;

    try {
      isLoading = true;

      if (!loadMore) {
        EasyLoading.show();
        moviesList.clear();
        currentPage = 1;
        nextCursor = null;
        hasMore = true;
      }

      moviesModelClass = await Api.to.getMovieList(
        cursor: nextCursor,
        perPage: perPage,
      );

      if (moviesModelClass != null && moviesModelClass!.data != null) {
        moviesList.addAll(moviesModelClass!.data!);

        // Update pagination info
        nextCursor = moviesModelClass!.nextCursor;
        hasMore = nextCursor != null && nextCursor!.isNotEmpty;

        currentPage++;
      }

      update();

    } catch (ex) {
      if (kDebugMode) {
        print('Exception : $ex');
      }
      Get.snackbar('Error', 'Failed to load movies');
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }

  void loadMoreMovies() {
    if (!isLoading && hasMore) {
      getMovies(loadMore: true);
    }
  }

  void refreshMovies() {
    getMovies(loadMore: false);
  }

  @override
  void onClose() {
    pageViewController.dispose();
    scrollViewController.dispose();
    super.onClose();
  }
}