import '../entities/entities.dart';

class Chat {
  final String? photo;
  final String? content;
  final String? messageID;
  final String senderID;
  final DateTime? timestamp;
  final bool? isHidden;
  final bool? isRead;

  const Chat({
    String? photo,
    String? content,
    String? messageID,
    required String senderID,
    DateTime? timestamp,
    this.isHidden = false,
    this.isRead = false,
  })  : this.photo = photo,
        this.content = content ?? 'content',
        this.messageID = messageID,
        this.senderID = senderID,
        this.timestamp = timestamp;

  static Chat get empty => Chat(senderID: '');

  Chat copyWith({
    String? photo,
    String? content,
    String? messageID,
    String? senderID,
    DateTime? timestamp,
    bool? isHidden,
    bool? isRead,
  }) {
    return Chat(
      photo: photo ?? this.photo,
      content: content ?? this.content,
      messageID: this.messageID,
      senderID: senderID ?? this.senderID,
      timestamp: this.timestamp,
      isHidden: isHidden ?? this.isHidden,
      isRead: isRead ?? this.isRead,
    );
  }

  @override
  int get hashCode =>
      photo.hashCode ^
      content.hashCode ^
      messageID.hashCode ^
      senderID.hashCode ^
      timestamp.hashCode ^
      isHidden.hashCode ^
      isRead.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Chat &&
          runtimeType == other.runtimeType &&
          photo == other.photo &&
          content == other.content &&
          messageID == other.messageID &&
          senderID == other.senderID &&
          timestamp == other.timestamp &&
          isHidden == other.isHidden &&
          isRead == other.isRead;

  @override
  String toString() {
    return 'Chat {   photo: $photo, content: $content, messageID: $messageID,  senderID: $senderID, timestamp: $timestamp, isHidden: $isHidden, isRead $isRead }';
  }

  ChatEntity toEntity() {
    return ChatEntity(
      photo,
      content,
      messageID,
      senderID,
      timestamp,
      isHidden,
      isRead,
    );
  }

  static Chat fromEntity(ChatEntity entity) {
    return Chat(
      photo: entity.photo,
      content: entity.content ?? 'content',
      messageID: entity.messageID,
      senderID: entity.senderID,
      timestamp: entity.timestamp,
      isHidden: entity.isHidden ?? false,
      isRead: entity.isRead ?? false,
    );
  }
}
