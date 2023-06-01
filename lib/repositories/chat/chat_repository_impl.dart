import 'package:dio/dio.dart';
import 'package:happy_chat/application/happy_chat/happy_chat_service.dart';
import 'package:happy_chat/models/message_model.dart';
import 'package:happy_chat/repositories/chat/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final dio = Dio();

  @override
  Future<MessageModel> sendMessage(MessageModel message) async {
    try {
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] =
          'Bearer ${HappyChatService.api_key}';

      final response = await dio.post(
        'https://api.openai.com/v1/chat/completions',
        data: {
          "model": "gpt-3.5-turbo",
          'messages': [
            {'role': 'user', 'content': message.message}
          ]
        },
      );
      final messageResponse =
          await response.data['choices'][0]['message']['content'];
      return MessageModel(message: messageResponse, isUserSend: false);
    } on DioError catch (e) {
      print(e.message);
      return throw Exception(e.message);
    }
  }
}
