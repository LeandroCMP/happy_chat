import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_chat/application/ui/happy_chat_app_ui_config.dart';
import 'package:happy_chat/modules/chat/chat_module.dart';
import 'package:happy_chat/modules/splashscreen/splash_module.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: HappyChatAppUiConfig.title,
      theme: HappyChatAppUiConfig.theme,
      getPages: [
        ...SplashModule().routers,
        ...ChatModule().routers,
      ],
    );
  }
}
