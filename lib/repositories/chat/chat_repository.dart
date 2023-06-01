import 'package:happy_chat/models/message_model.dart';

abstract class ChatRepository {
  Future<MessageModel> sendMessage(MessageModel message);
}
