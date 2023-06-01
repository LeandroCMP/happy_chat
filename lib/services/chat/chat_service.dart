import 'package:happy_chat/models/message_model.dart';

abstract class ChatService {
  Future<MessageModel> sendMessage(MessageModel message);
}
