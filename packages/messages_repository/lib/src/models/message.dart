import '../entities/entities.dart';

/// Message { employeeID,displayName, jobID, photo, content, messageID, isHidden }
class Message {
  final List? seen;
  final List? members;
  final bool? isRead;
  final DateTime? timestamp;
  final String? content;

  /// Sender ID
  final String employeeID;
  final String employerID;

  /// User Display Name
  final String? displayName;

  /// Job ID
  final String jobID;

  /// Message ID
  final String? messageID;

  /// Message delete
  final bool? isHidden;

  const Message({
    List? seen,
    List? members,
    this.isRead = false,
    DateTime? timestamp,
    String? content,
    required String employeeID,
    required String employerID,
    String? displayName,
    required String jobID,
    String? messageID,
    this.isHidden = false,
  })  : this.seen = seen ?? const [],
        this.members = members ?? const [],
        this.timestamp = timestamp,
        this.content = content,
        this.employeeID = employeeID,
        this.employerID = employerID,
        this.displayName = displayName,
        this.jobID = jobID,
        this.messageID = messageID;

  static Message get empty => Message(
        content: '',
        employeeID: '',
        employerID: '',
        displayName: '',
        jobID: '',
      );

  Message copyWith({
    List? seen,
    List? members,
    bool? isRead,
    DateTime? timestamp,
    String? content,
    String? employeeID,
    String? employerID,
    String? displayName,
    String? jobID,
    String? messageID,
    bool? isHidden,
  }) {
    return Message(
      seen: seen ?? this.seen,
      members: members ?? this.members,
      isRead: isRead ?? this.isRead,
      timestamp: timestamp ?? this.timestamp,
      content: content ?? this.content,
      employeeID: employeeID ?? this.employeeID,
      employerID: employerID ?? this.employerID,
      displayName: displayName ?? this.displayName,
      jobID: jobID ?? this.jobID,
      messageID: messageID ?? this.messageID,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  get timestamps {
    if (timestamp == null) {
      Future.delayed(const Duration(seconds: 1));

      return timestamp;
    }
    return timestamp;
  }

  @override
  int get hashCode =>
      seen.hashCode ^
      members.hashCode ^
      isRead.hashCode ^
      timestamp.hashCode ^
      content.hashCode ^
      employeeID.hashCode ^
      employerID.hashCode ^
      displayName.hashCode ^
      jobID.hashCode ^
      messageID.hashCode ^
      isHidden.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Message &&
          runtimeType == other.runtimeType &&
          seen == other.seen &&
          members == other.members &&
          isRead == other.isRead &&
          timestamp == other.timestamp &&
          content == other.content &&
          employeeID == other.employeeID &&
          employerID == other.employerID &&
          displayName == other.displayName &&
          jobID == other.jobID &&
          messageID == other.messageID &&
          isHidden == other.isHidden;

  @override
  String toString() {
    return 'Message { seen: $seen, members: $members, isRead: $isRead, timestamp: $timestamp, content: $content, employeeID: $employeeID, employerID: $employerID, displayName: $displayName, jobID: $jobID, messageID: $messageID, isHidden: $isHidden, }';
  }

  MessageEntity toEntity() {
    return MessageEntity(
      seen,
      members,
      isRead,
      timestamp,
      content,
      employeeID,
      employerID,
      displayName,
      jobID,
      messageID,
      isHidden,
    );
  }

  static Message fromEntity(MessageEntity entity) {
    return Message(
      seen: entity.seen,
      members: entity.members,
      isRead: entity.isRead,
      timestamp: entity.timestamp,
      content: entity.content,
      employeeID: entity.employeeID,
      employerID: entity.employerID,
      displayName: entity.displayName,
      jobID: entity.jobID,
      messageID: entity.messageID,
      isHidden: entity.isHidden,
    );
  }
}
