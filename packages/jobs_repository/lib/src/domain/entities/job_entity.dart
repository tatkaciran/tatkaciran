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

  @override
  List<Object> get props => [jobID];

  @override
  String toString() {
    return 'JobEntity { photo: $photo, jobID: $jobID, userID: $userID, description: $description, salary: $salary, expiryDate: $expiryDate, userName: $userName, isHidden: $isHidden, messages: $messages }';
  }
}
