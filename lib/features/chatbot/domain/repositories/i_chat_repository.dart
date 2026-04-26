import '../entities/chat_message_entity.dart';

abstract class IChatRepository {
  /// Sends a text message and returns the bot's reply.
  Future<ChatMessageEntity> sendTextMessage(String text);

  /// Sends a file (image or PDF) and returns the bot's reply.
  Future<ChatMessageEntity> sendFileMessage({
    required String fileName,
    required MessageType type,
  });
}