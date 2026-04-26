import 'package:injectable/injectable.dart';
import '../entities/chat_message_entity.dart';
import '../repositories/i_chat_repository.dart';

@injectable
class SendTextMessageUseCase {
  final IChatRepository _repository;
  SendTextMessageUseCase(this._repository);

  Future<ChatMessageEntity> call(String text) =>
      _repository.sendTextMessage(text);
}

@injectable
class SendFileMessageUseCase {
  final IChatRepository _repository;
  SendFileMessageUseCase(this._repository);

  Future<ChatMessageEntity> call({
    required String fileName,
    required MessageType type,
  }) =>
      _repository.sendFileMessage(fileName: fileName, type: type);
}