import 'package:flutter/foundation.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:movie_mate/model/MovieListModel.dart';
import 'package:movie_mate/ui/movie_details/bind/movie_details_bind.dart';
import 'package:movie_mate/utilities/api_provider.dart';
import 'package:movie_mate/utilities/com_binding.dart';
import 'package:movie_mate/utilities/session_keys.dart';

class WishlistBind implements Bindings {
  @override
  void dependencies() {
    Get.put(WishlistController());
  }
}

class WishlistController extends GetxController {
  static WishlistController get to => Get.find();

  MoviesModelClass?moviesModelClass;

  var wishlist = <int>[].obs;

  @override
  void onInit() {

    // Load wishlist from session
    List<int> storedWishlist = AppSession.to.session.read(SessionKeys.FAVOURITE)?.cast<int>() ?? [];
    print('hgfghii==>$storedWishlist');
    wishlist.value = storedWishlist;
    print('wish print itemmmm==>${wishlist.length}');

    getMovies();
    super.onInit();
  }

  Future<void> getMovies() async {
    try {
      EasyLoading.show();
      10.cDelay(() {
        EasyLoading.dismiss();
      });
      moviesModelClass = await Api.to.getMovieList();
      EasyLoading.dismiss();
      print('model profile ${moviesModelClass?.data?.length}');
    } catch (ex) {
      EasyLoading.dismiss();
      if (kDebugMode) {
        print('Exception : $ex');
      }
    } finally {
      EasyLoading.dismiss();
      update();
    }
  }
}