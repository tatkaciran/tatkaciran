import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final List? seen;
  final List? members;
  final bool? isRead;
  final DateTime? timestamp;
  final String? content;
  final String employeeID;
  final String employerID;
  final String? displayName;
  final String jobID;
  final String? messageID;
  final bool? isHidden;

  const MessageEntity(
    this.seen,
    this.members,
    this.isRead,
    this.timestamp,
    this.content,
    this.employeeID,
    this.employerID,
    this.displayName,
    this.jobID,
    this.messageID,
    this.isHidden,
  );

  @override
  List<Object> get props => [
        employeeID,
        employerID,
        jobID,
      ];

  @override
  String toString() {
    return 'MessageEntity { seen: $seen, members: $members, isRead: $isRead, timestamp: $timestamp, content: $content, employeeID: $employeeID, employerID: $employerID, displayName: $displayName, jobID: $jobID, messageID: $messageID, isHidden: $isHidden,  }';
  }

  static MessageEntity fromJson(Map<String, Object?> json) {
    return MessageEntity(
      json['seen'] as List?,
      json['members'] as List?,
      json['isRead'] as bool?,
      (json['timestamp'] as Timestamp).toDate(),
      json['content'] as String?,
      json['employeeID'] as String,
      json['employerID'] as String,
      json['displayName'] as String?,
      json['job_id'] as String,
      json['message_id'] as String?,
      json['is_hidden'] as bool?,
    );
  }

  static MessageEntity fromSnapshot(DocumentSnapshot snap) {
    return MessageEntity(
      snap.get('seen') as List?,
      snap.get('members') as List?,
      snap.get('isRead') as bool?,
      (snap.get('timestamp') as Timestamp? ?? Timestamp.now()).toDate(),
      snap.get('content') as String?,
      snap.get('employeeID') as String,
      snap.get('employerID') as String,
      snap.get('displayName') as String?,
      snap.get('job_id') as String,
      snap.id,
      snap.get('is_hidden') as bool?,
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'seen': seen,
      'members': FieldValue.arrayUnion([employeeID, employerID]),
      // 'members': [employeeID, employerID],
      'isRead': isRead,
      'timestamp': timestamp ?? FieldValue.serverTimestamp(),
      'content': content,
      'employeeID': employeeID,
      'employerID': employerID,
      'displayName': displayName,
      'job_id': jobID,
      // 'message_id': messageID,
      'is_hidden': isHidden,
    };
  }
}
