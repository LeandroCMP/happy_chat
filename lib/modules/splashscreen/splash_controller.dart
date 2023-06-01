import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    await Future.delayed(4.seconds, () => {Get.offAndToNamed('/chat')});
    super.onReady();
  }
}
