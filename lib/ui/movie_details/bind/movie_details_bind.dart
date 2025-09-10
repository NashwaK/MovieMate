import 'package:flutter/foundation.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:movie_mate/model/MovieListModel.dart';
import 'package:movie_mate/utilities/api_provider.dart';

class MovieDetailsBind implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController());
  }
}

class MovieDetailsController extends GetxController {
  static MovieDetailsController get to => Get.find();

  MoviesModelClass?moviesModelClass;

  var index = 0.obs;

  @override
  void onInit() {
    index.value = int.tryParse(Get.parameters['index'] ?? '0') ?? 0;
    print('index issssssssssssssssss$index');
    getMovies();
    super.onInit();
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