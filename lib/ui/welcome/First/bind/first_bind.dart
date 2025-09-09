import 'package:get/get.dart';

class FirstWelcomeBind implements Bindings {
  @override
  void dependencies() {
    Get.put(FirstWelcomeController());
  }
}

class FirstWelcomeController extends GetxController {
  static FirstWelcomeController get to => Get.find();

}