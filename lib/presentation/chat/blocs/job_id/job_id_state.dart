part of 'job_id_bloc.dart';

abstract class JobIdState extends Equatable {
  const JobIdState();

  @override
  List<Object> get props => [];
}

class GetJobId extends JobIdState {
  final String jobID;

  const GetJobId(this.jobID);

  @override
  List<Object> get props => [jobID];
}
