import '../entities/entities.dart';

class Job {
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
  });

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

  JobEntity toEntity() {
    return JobEntity(
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
  }

  static Job fromEntity(JobEntity entity) {
    return Job(
      photo: entity.photo,
      jobID: entity.jobID,
      userID: entity.userID,
      description: entity.description,
      salary: entity.salary,
      expiryDate: entity.expiryDate,
      userName: entity.userName?.replaceAll(' ', ''),
      isHidden: entity.isHidden,
      messages: entity.messages,
    );
  }
}
