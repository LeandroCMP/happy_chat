import 'package:happy_chat/models/message_model.dart';
import 'package:happy_chat/repositories/chat/chat_repository.dart';
import 'package:happy_chat/services/chat/chat_service.dart';

class ChatServiceImpl implements ChatService {
  final ChatRepository _chatRepository;

  ChatServiceImpl({required ChatRepository chatRepository})
      : _chatRepository = chatRepository;

  @override
  Future<MessageModel> sendMessage(MessageModel message) =>
      _chatRepository.sendMessage(message);
}
