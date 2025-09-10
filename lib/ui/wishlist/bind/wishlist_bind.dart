import 'package:get/get.dart';

class WishlistBind implements Bindings {
  @override
  void dependencies() {
    Get.put(WishlistController());
  }
}

class WishlistController extends GetxController {
  static WishlistController get to => Get.find();
}