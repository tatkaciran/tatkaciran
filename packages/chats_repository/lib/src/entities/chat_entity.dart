import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  final String? photo;
  final String? content;
  final String? messageID;
  final String senderID;
  final DateTime? timestamp;
  final bool? isHidden;
  final bool? isRead;

  const ChatEntity(
    this.photo,
    this.content,
    this.messageID,
    this.senderID,
    this.timestamp,
    this.isHidden,
    this.isRead,
  );

  @override
  List<Object> get props => [senderID];

  @override
  String toString() {
    return 'ChatEntity { photo: $photo, content: $content, messageID: $messageID, senderID: $senderID, timestamp: $timestamp, isHidden: $isHidden, isRead $isRead }';
  }

  // Map<ChatEntity, String> chatFieldValue = {
  //   ChatEntity.
  // };

  static ChatEntity fromJson(Map<String, Object> json) {
    return ChatEntity(
      json['photo'] as String,
      json['content'] as String,
      json['message_id'] as String,
      json['sender_id'] as String,
      (json['timestamp'] as Timestamp).toDate(),
      json['is_hidden'] as bool,
      json['is_read'] as bool,
    );
  }

  static ChatEntity fromSnapshot(DocumentSnapshot snap) {
    return ChatEntity(
      snap.get('photo') as String,
      snap.get('content') as String,
      snap.id,
      snap.get('sender_id') as String,
      (snap.get('timestamp') as Timestamp).toDate(),
      snap.get('is_hidden') as bool,
      snap.get('is_read') as bool,
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'photo': photo,
      'content': content,
      'sender_id': senderID,
      'timestamp': FieldValue.serverTimestamp(),
      'is_hidden': isHidden,
      'is_read': isRead,
    };
  }
}
