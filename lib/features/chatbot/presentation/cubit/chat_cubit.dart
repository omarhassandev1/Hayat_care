import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/use_cases/send_message_use_case.dart';
import 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final SendTextMessageUseCase _sendText;
  final SendFileMessageUseCase _sendFile;

  ChatCubit(this._sendText, this._sendFile) : super(const ChatState()) {
    _addWelcomeMessage();
  }

  // ── helpers ──────────────────────────────

  void _addWelcomeMessage() {
    final welcome = ChatMessageEntity(
      id: const Uuid().v4(),
      content:
      "👋 Hello! I'm your Hayat Care health assistant.\n\nI can help with general health information. You can also send me an image or PDF of your lab results for a brief overview.\n\n⚠️ I do not provide diagnoses. Always consult a doctor for medical decisions.",
      isUser: false,
      type: MessageType.text,
      createdAt: DateTime.now(),
    );
    emit(state.copyWith(messages: [welcome]));
  }

  ChatMessageEntity _buildUserMessage(String content, MessageType type) {
    return ChatMessageEntity(
      id: const Uuid().v4(),
      content: content,
      isUser: true,
      type: type,
      createdAt: DateTime.now(),
    );
  }

  void _appendMessage(ChatMessageEntity msg) {
    emit(state.copyWith(messages: [...state.messages, msg]));
  }

  // ── public actions ────────────────────────

  Future<void> sendText(String text) async {
    if (text.trim().isEmpty) return;

    _appendMessage(_buildUserMessage(text, MessageType.text));
    emit(state.copyWith(isBotTyping: true, status: ChatStatus.sending));

    try {
      final reply = await _sendText(text);
      _appendMessage(reply);
      emit(state.copyWith(isBotTyping: false, status: ChatStatus.success));
    } catch (_) {
      emit(state.copyWith(
        isBotTyping: false,
        status: ChatStatus.error,
        errorMessage: 'Something went wrong. Please try again.',
      ));
    }
  }

  Future<void> sendFile({
    required String fileName,
    required MessageType type,
  }) async {
    _appendMessage(_buildUserMessage(fileName, type));
    emit(state.copyWith(isBotTyping: true, status: ChatStatus.sending));

    try {
      final reply = await _sendFile(fileName: fileName, type: type);
      _appendMessage(reply);
      emit(state.copyWith(isBotTyping: false, status: ChatStatus.success));
    } catch (_) {
      emit(state.copyWith(
        isBotTyping: false,
        status: ChatStatus.error,
        errorMessage: 'Failed to process file. Please try again.',
      ));
    }
  }
}