part of 'job_id_and_employee_id_bloc.dart';

abstract class JobIdAndEmployeeIdEvent extends Equatable {
  const JobIdAndEmployeeIdEvent();

  @override
  List<Object> get props => [];
}

class SetJobIDAndEmployeeID extends JobIdAndEmployeeIdEvent {
  final String jobID;
  final String employeeID;
  final String employerID;
  final String displayName;

  const SetJobIDAndEmployeeID({
    required this.displayName,
    required this.jobID,
    required this.employeeID,
    required this.employerID,
  });

  @override
  List<Object> get props => [jobID, employeeID, employerID, displayName];
}
