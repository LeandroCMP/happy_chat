// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModel {
  final String message;
  bool? isUserSend;

  MessageModel({
    required this.message,
    this.isUserSend = true,
  });

  @override
  String toString() =>
      'MessageModel(message: $message, isUserSend: $isUserSend)';
}
