import '../../domain/entities/chat_message_entity.dart';

enum ChatStatus { initial, sending, success, error }

class ChatState {
  final List<ChatMessageEntity> messages;
  final ChatStatus status;
  final bool isBotTyping;
  final String? errorMessage;

  const ChatState({
    this.messages = const [],
    this.status = ChatStatus.initial,
    this.isBotTyping = false,
    this.errorMessage,
  });

  ChatState copyWith({
    List<ChatMessageEntity>? messages,
    ChatStatus? status,
    bool? isBotTyping,
    String? errorMessage,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      status: status ?? this.status,
      isBotTyping: isBotTyping ?? this.isBotTyping,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}