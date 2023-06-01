import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:happy_chat/application/ui/happy_chat_app_ui_config.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import './chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(HappyChatAppUiConfig.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return ListView.builder(
                    itemCount: controller.messages.length,
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    itemBuilder: (context, index) {
                      final message = controller.messages[index];
                      return BubbleSpecialThree(
                        text: message.message,
                        color: message.isUserSend!
                            ? const Color(0xFFBB86FC)
                            : const Color(0xFF018786),
                        tail: true,
                        textStyle: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                        ),
                        isSender: message.isUserSend ?? false,
                      );
                    });
              }),
            ),
          ),
          Obx(() {
            return Visibility(
              visible: controller.isLoading.value,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LoadingAnimationWidget.waveDots(
                      color: const Color(0xFFFFFFFF),
                      size: 20,
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(
            height: 70,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.messageEC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: const Color(0xFF121212),
                        filled: true,
                        labelText: 'Digite sua mensagem!',
                        labelStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                        contentPadding: const EdgeInsets.only(left: 20),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                  Obx(() {
                    return IconButton(
                      onPressed: controller.enabledButton.value
                          ? () {
                              controller.sendMessage();
                            }
                          : null,
                      icon: Icon(
                        Icons.send,
                        color: controller.enabledButton.value
                            ? const Color(0xFFBB86FC)
                            : Colors.grey,
                      ),
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
