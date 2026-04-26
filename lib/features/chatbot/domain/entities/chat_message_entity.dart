enum MessageType { text, image, file }

class ChatMessageEntity {
  final String id;
  final String content;
  final bool isUser;
  final MessageType type;
  final DateTime createdAt;

  const ChatMessageEntity({
    required this.id,
    required this.content,
    required this.isUser,
    required this.type,
    required this.createdAt,
  });
}