import 'package:get/get.dart';

class SecondWelcomeBind implements Bindings {
  @override
  void dependencies() {
    Get.put(SecondWelcomeController());
  }
}

class SecondWelcomeController extends GetxController {
  static SecondWelcomeController get to => Get.find();

}