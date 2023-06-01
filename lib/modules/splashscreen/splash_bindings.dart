import 'package:get/get.dart';
import 'package:happy_chat/modules/splashscreen/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
