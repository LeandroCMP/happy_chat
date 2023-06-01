import 'package:get/get.dart';
import 'package:happy_chat/repositories/chat/chat_repository.dart';
import 'package:happy_chat/repositories/chat/chat_repository_impl.dart';
import 'package:happy_chat/services/chat/chat_service.dart';
import 'package:happy_chat/services/chat/chat_service_impl.dart';
import './chat_controller.dart';

class ChatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatRepository>(() => ChatRepositoryImpl());
    Get.lazyPut<ChatService>(() => ChatServiceImpl(chatRepository: Get.find()));
    Get.lazyPut(() => ChatController(chatService: Get.find()));
  }
}
