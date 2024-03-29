import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:happy_chat/application/modules/module.dart';
import 'package:happy_chat/modules/splashscreen/splash_bindings.dart';
import 'package:happy_chat/modules/splashscreen/splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBindings(),
    )
  ];
}
