part of 'job_id_and_employee_id_bloc.dart';

abstract class JobIdAndEmployeeIdState extends Equatable {
  const JobIdAndEmployeeIdState();

  @override
  List<Object> get props => [];
}

class GetJobIDAndEmployeeID extends JobIdAndEmployeeIdState {
  final String displayName;
  final String jobID;
  final String employeeID;
  final String employerID;

  const GetJobIDAndEmployeeID({
    required this.displayName,
    required this.jobID,
    required this.employeeID,
    required this.employerID,
  });

  @override
  List<Object> get props => [jobID, employeeID, employerID, displayName];
}
