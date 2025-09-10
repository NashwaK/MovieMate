import 'package:get/get.dart';

class MovieDetailsBind implements Bindings {
  @override
  void dependencies() {
    Get.put(MovieDetailsController());
  }
}

class MovieDetailsController extends GetxController {
  static MovieDetailsController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
  }
}