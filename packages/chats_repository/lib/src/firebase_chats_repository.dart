import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'entities/entities.dart';
import 'chats_repository.dart';
import 'models/models.dart';

class FirebaseChatsRepository implements ChatsRepository {
  final messageCollection = FirebaseFirestore.instance.collection('messages');

  @override
  Future<void> addNewChat({
    required Chat chat,
    required String employeeID,
    required String jobID,
  }) {
    return messageCollection
        .doc(jobID)
        .collection('chats')
        .doc(employeeID)
        .collection('conversations')
        .add(chat.toEntity().toDocument());
  }

  @override
  Future<void> deleteChat({
    required Chat chat,
    String? employeeID,
    required String jobID,
    required String messageID,
  }) {
    return messageCollection
        .doc(jobID)
        .collection('chats')
        .doc(employeeID)
        .collection('conversations')
        .doc(chat.messageID)
        .delete();
  }

  @override
  Future<void> updateChat({
    required Chat chat,
    String? employeeID,
    String? jobID,
    String? messageID,
  }) {
    print('document ıd' + chat.messageID.toString());
    return messageCollection
        .doc(jobID)
        .collection('chats')
        .doc(employeeID)
        .collection('conversations')
        .doc(messageID)
        .set(chat.toEntity().toDocument());
  }

  @override
  Stream<List<Chat>> chats({
    required String jobID,
    required String employeeID,
  }) async* {
    Stream<QuerySnapshot> snapshots = messageCollection
        .doc(jobID)
        .collection('chats')
        .doc(employeeID)
        .collection('conversations')
        .where('is_hidden', isEqualTo: false)
        .orderBy('timestamp', descending: true)
        .snapshots();

    await for (QuerySnapshot snapshot in snapshots) {
      List<Chat> _chats = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        print(doc.metadata.isFromCache ? "Cached" : "Not Cached");
        Chat _chat = Chat.fromEntity(ChatEntity.fromSnapshot(doc));
        _chats.add(_chat);
      }
      yield _chats;
    }
  }

  @override
  Stream<bool> isRead({
    required String jobID,
    required String employeeID,
  }) {
    return messageCollection
        .doc(jobID)
        .collection('chats')
        .doc(employeeID)
        .collection('conversations')
        .where('is_hidden', isEqualTo: false)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      List<Chat> isReadList = snapshot.docs.map((doc) {
        print(doc.metadata.isFromCache ? "Cached" : "Not Cached");
        return Chat.fromEntity(ChatEntity.fromSnapshot(doc));
      }).toList();
      bool isRead = isReadList.any((chat) => chat.isRead == true);
      return isRead;
    });
  }
}
