import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_repository/src/domain/domain.dart';

class Job extends JobEntity {
  final List? messages;
  final String? photo;
  final String jobID;
  final String? userID;
  final String? description;
  final String? salary;
  final int? expiryDate;
  final String? userName;
  final bool? isHidden;

  static Job get empty => Job(jobID: '');

  Job({
    this.messages,
    this.photo = '',
    required this.jobID,
    this.userID,
    this.description,
    this.salary,
    this.expiryDate,
    this.userName,
    this.isHidden = false,
  }) : super(
          photo,
          jobID,
          userID,
          description,
          salary,
          expiryDate,
          userName,
          isHidden,
          messages,
        );

  Job copyWith({
    List? messages,
    String? photo,
    String? jobID,
    String? userID,
    String? description,
    String? salary,
    int? expiryDate,
    String? userName,
    bool? isHidden,
  }) {
    return Job(
      messages: messages ?? this.messages,
      photo: photo ?? this.photo,
      jobID: jobID ?? this.jobID,
      userID: userID ?? this.userID,
      description: description ?? this.description,
      salary: salary ?? this.salary,
      expiryDate: expiryDate ?? this.expiryDate,
      userName: userName ?? this.userName,
      isHidden: isHidden ?? this.isHidden,
    );
  }

  @override
  int get hashCode =>
      messages.hashCode ^
      photo.hashCode ^
      jobID.hashCode ^
      userID.hashCode ^
      description.hashCode ^
      salary.hashCode ^
      expiryDate.hashCode ^
      userName.hashCode ^
      isHidden.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Job &&
          runtimeType == other.runtimeType &&
          messages == other.messages &&
          photo == other.photo &&
          jobID == other.jobID &&
          userID == other.userID &&
          description == other.description &&
          salary == other.salary &&
          expiryDate == other.expiryDate &&
          userName == other.userName &&
          isHidden == other.isHidden;

  @override
  String toString() {
    return 'AddJob { messages: $messages, photo: $photo, jobID: $jobID, userID: $userID, description: $description, salary: $salary, expiryDate: $expiryDate, userName: $userName, isHidden: $isHidden }';
  }

  Map<String, Object?> toJson() {
    return {
      'photo': photo,
      'job_id': jobID,
      'user_id': userID,
      'description': description,
      'salary': salary,
      'expiry_date': expiryDate,
      'user_name': userName,
      'is_hidden': isHidden,
      'messages': messages,
    };
  }

  static Job fromJson(Map<String, Object?> json) {
    return Job(
      photo: json['photo'] as String?,
      jobID: json['job_id'] as String,
      userID: json['user_id'] as String?,
      description: json['description'] as String?,
      salary: json['salary'] as String?,
      expiryDate: json['expiry_date'] as int?,
      userName: json['user_name'] as String?,
      isHidden: json['is_hidden'] as bool?,
      messages: json['messages'] as List?,
    );
  }

  static Job fromSnapshot(DocumentSnapshot snap) {
    return Job(
      photo: snap.get('photo'),
      jobID: snap.id,
      userID: snap.get('user_id'),
      description: snap.get('description'),
      salary: snap.get('salary'),
      expiryDate: snap.get('expiry_date'),
      userName: snap.get('user_name'),
      isHidden: snap.get('is_hidden'),
      messages: snap.get('messages'),
    );
  }

  Map<String, Object?> toDocument() {
    return {
      'photo': photo,
      'job_id': jobID,
      'user_id': userID,
      'description': description,
      'salary': salary,
      'expiry_date': expiryDate,
      'user_name': userName,
      'is_hidden': isHidden,
      'messages': messages,
    };
  }

  // JobEntity toEntity() {
  //   return JobEntity(
  //     photo,
  //     jobID,
  //     userID,
  //     description,
  //     salary,
  //     expiryDate,
  //     userName,
  //     isHidden,
  //     messages,
  //   );
  // }

  // static Job fromEntity(JobEntity entity) {
  //   return Job(
  //     photo: entity.photo,
  //     jobID: entity.jobID,
  //     userID: entity.userID,
  //     description: entity.description,
  //     salary: entity.salary,
  //     expiryDate: entity.expiryDate,
  //     userName: entity.userName?.replaceAll(' ', ''),
  //     isHidden: entity.isHidden,
  //     messages: entity.messages,
  //   );
  // }
}
