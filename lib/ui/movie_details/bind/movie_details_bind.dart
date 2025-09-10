import 'package:flutter/foundation.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:movie_mate/model/MovieListModel.dart';
import 'package:movie_mate/utilities/api_provider.dart';
import 'package:movie_mate/utilities/com_binding.dart';
import 'package:movie_mate/utilities/session_keys.dart';

class MovieDetailsBind implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController());
  }
}

class MovieDetailsController extends GetxController {
  static MovieDetailsController get to => Get.find();

  MoviesModelClass? moviesModelClass;

  var index = 0.obs;
  var favouriteButton = false.obs;

  var wishlist = <int>[].obs;

  @override
  void onInit() {
    index.value = int.tryParse(Get.parameters['index'] ?? '0') ?? 0;
    print('index is $index');

    // Load wishlist from session
    List<int> storedWishlist = AppSession.to.session.read(SessionKeys.FAVOURITE)?.cast<int>() ?? [];
    print('kiiiiiiiiikii$storedWishlist');
    wishlist.value = storedWishlist;

    // Set favouriteButton initial state for this index
    favouriteButton.value = wishlist.contains(index.value);

    ever(wishlist, (_) {
      print("Wishlist updated: $wishlist");
      // Save updated wishlist to session whenever it changes
      AppSession.to.session.write(SessionKeys.FAVOURITE, wishlist);
    });

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

  void toggleWishlist(int idx) {
    if (wishlist.contains(idx)) {
      wishlist.remove(idx);
      favouriteButton.value = false;
      print("Removed product $idx from wishlist");
    } else {
      wishlist.add(idx);
      favouriteButton.value = true;
      print("Added product $idx to wishlist");
    }

    // This automatically updates session because of 'ever' above
    print("Current wishlist: $wishlist");
  }

  bool isInWishlist(int idx) {
    return wishlist.contains(idx);
  }
}

//class MovieDetailsController extends GetxController {
//   static MovieDetailsController get to => Get.find();
//
//   MoviesModelClass?moviesModelClass;
//
//   var index = 0.obs;
//   var favouriteButton = false.obs;
//
//   var wishlist = <int>[].obs;
//
//   @override
//   void onInit() {
//     index.value = int.tryParse(Get.parameters['index'] ?? '0') ?? 0;
//     print('index issssssssssssssssss$index');
//     getMovies();
//     ever(wishlist, (_) {
//       print("Wishlist updated: $wishlist");
//     });
//     super.onInit();
//   }
//
//   Future<void> getMovies() async {
//     try {
//       // if (AppSession.to.session.read(SessionKeys.TOKEN) == null) {
//       //   return;
//       // }
//       EasyLoading.show();
//       10.cDelay(() {
//         EasyLoading.dismiss();
//       });
//       moviesModelClass = await Api.to.getMovieList();
//       EasyLoading.dismiss();
//       print('model profile ${moviesModelClass?.data?.length}');
//       // if (!(moviesModelClass?.success ?? false)) {
//       //   EasyLoading.showToast(moviesModelClass?.message ?? '');
//       //   // Get.snackbar(walletModel?.message ?? '', '');
//       // }
//       // dataRefresh = false.obs;
//     } catch (ex) {
//       // dataRefresh = false.obs;
//       EasyLoading.dismiss();
//       if (kDebugMode) {
//         print('Exception : $ex');
//       }
//     } finally {
//       // dataRefresh = false.obs;
//       EasyLoading.dismiss();
//       update();
//     }
//   }
//
//   void toggleWishlist(int index) {
//     if (wishlist.contains(index)) {
//       wishlist.remove(index);
//       print("Removed product $index from wishlist");
//     } else {
//       wishlist.add(index);
//       print("Added product $index to wishlist");
//     }
//
//     print("Current wishlist: $wishlist");
//   }
//
//
//   /// Helper: check if index is in wishlist
//   bool isInWishlist(int index) {
//     return wishlist.contains(index);
//   }
// }