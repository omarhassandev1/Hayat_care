import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/chat_message_entity.dart';
import '../../domain/repositories/i_chat_repository.dart';
import '../datasources/local_chat_datasource.dart';

@LazySingleton(as: IChatRepository)
class ChatRepositoryImpl implements IChatRepository {
  final LocalChatDatasource _datasource;
  ChatRepositoryImpl(this._datasource);

  @override
  Future<ChatMessageEntity> sendTextMessage(String text) async {
    final response = await _datasource.getTextResponse(text);
    return ChatMessageEntity(
      id: const Uuid().v4(),
      content: response,
      isUser: false,
      type: MessageType.text,
      createdAt: DateTime.now(),
    );
  }

  @override
  Future<ChatMessageEntity> sendFileMessage({
    required String fileName,
    required MessageType type,
  }) async {
    final response = await _datasource.getFileResponse(type);
    return ChatMessageEntity(
      id: const Uuid().v4(),
      content: response,
      isUser: false,
      type: MessageType.text, // bot always replies in text
      createdAt: DateTime.now(),
    );
  }
}