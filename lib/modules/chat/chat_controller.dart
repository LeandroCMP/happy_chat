// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:happy_chat/models/message_model.dart';
import 'package:happy_chat/services/chat/chat_service.dart';

class ChatController extends GetxController {
  final ChatService _chatService;
  ChatController({required ChatService chatService})
      : _chatService = chatService;

  final List<MessageModel> messages = <MessageModel>[].obs;

  final messageEC = TextEditingController();

  final RxBool enabledButton = false.obs;

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    messageEC.addListener(() {
      if (messageEC.text.isEmpty) {
        updateButton(false);
      } else {
        updateButton(true);
      }
    });
    super.onInit();
  }

  updateButton(bool value) => enabledButton(value);

  newMessage() {
    messages.insert(0, MessageModel(message: messageEC.text));
  }

  sendMessage() async {
    try {
      newMessage();
      isLoading(true);
      final messageModel = MessageModel(message: messageEC.text);
      messageEC.clear();
      final result = await _chatService.sendMessage(messageModel);
      isLoading(false);
      messages.insert(0, result);
    } catch (e) {
      Get.defaultDialog(content: Text(e.toString()));
      isLoading(false);
    }
  }
}
