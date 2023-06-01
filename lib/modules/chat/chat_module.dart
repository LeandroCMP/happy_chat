import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:happy_chat/application/modules/module.dart';
import 'package:happy_chat/modules/chat/chat_bindings.dart';
import 'package:happy_chat/modules/chat/chat_page.dart';

class ChatModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/chat',
      page: () => const ChatPage(),
      binding: ChatBindings(),
    )
  ];
}
