import 'package:get/get.dart';

class HappyChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HappyChatBindings());
  }
}
