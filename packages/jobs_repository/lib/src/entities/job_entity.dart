import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class JobEntity extends Equatable {
  final String? photo;
  final String jobID;
  final String? userID;
  final String? description;
  final String? salary;
  final int? expiryDate;
  final String? userName;
  final bool? isHidden;
  final List? messages;

  const JobEntity(
    this.photo,
    this.jobID,
    this.userID,
    this.description,
    this.salary,
    this.expiryDate,
    this.userName,
    this.isHidden,
    this.messages,
  );

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

  @override
  List<Object> get props => [jobID];

  @override
  String toString() {
    return 'JobEntity { photo: $photo, jobID: $jobID, userID: $userID, description: $description, salary: $salary, expiryDate: $expiryDate, userName: $userName, isHidden: $isHidden, messages: $messages }';
  }

  static JobEntity fromJson(Map<String, Object?> json) {
    return JobEntity(
      json['photo'] as String?,
      json['job_id'] as String,
      json['user_id'] as String?,
      json['description'] as String?,
      json['salary'] as String?,
      json['expiry_date'] as int?,
      json['user_name'] as String?,
      json['is_hidden'] as bool?,
      json['messages'] as List?,
    );
  }

  static JobEntity fromSnapshot(DocumentSnapshot snap) {
    print('++++++++++++++++' + snap.exists.toString());
    return JobEntity(
      snap.get('photo'),
      snap.id,
      snap.get('user_id'),
      snap.get('description'),
      snap.get('salary'),
      snap.get('expiry_date'),
      snap.get('user_name'),
      snap.get('is_hidden'),
      snap.get('messages'),
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
}
