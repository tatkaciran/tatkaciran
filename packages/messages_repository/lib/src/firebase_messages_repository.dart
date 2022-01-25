import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'entities/entities.dart';
import 'messages_repository.dart';
import 'models/models.dart';

class FirebaseMessagesRepository implements MessagesRepository {
  final messageCollection = FirebaseFirestore.instance.collection('messages');

  @override
  Future<void> addNewMessage({
    required Message message,
    required String employeeID,
    required String jobID,
  }) {
    DocumentReference messages = messageCollection.doc(jobID);
    return messages.set({'jobID': jobID}).then((value) => messages
        .collection('chats')
        .doc(employeeID)
        .set(message.toEntity().toDocument()));
  }

  @override
  Future<void> deleteMessage(Message message) {
    return messageCollection.doc(message.messageID).delete();
  }

  @override
  Stream<List<Message>> messages(
    String userID,
  ) {
    Query messages = messageCollection.firestore.collectionGroup('chats');

    return messages
        .where('is_hidden', isEqualTo: false)
        .orderBy('timestamp', descending: true)
        .where('members', arrayContains: userID)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Message.fromEntity(MessageEntity.fromSnapshot(doc)))
              .toList(),
        );
  }

  @override
  Future<void> updateMessage({
    required Message message,
    required String employeeID,
    required String jobID,
  }) {
    DocumentReference messages = messageCollection.doc(jobID);
    return messages.set({'jobID': jobID}).then((value) => messages
        .collection('chats')
        .doc(employeeID)
        .set(message.toEntity().toDocument()));
  }
}
