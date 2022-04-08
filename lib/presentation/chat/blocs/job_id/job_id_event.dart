part of 'job_id_bloc.dart';

abstract class JobIdEvent extends Equatable {
  const JobIdEvent();

  @override
  List<Object> get props => [];
}

class SetJobId extends JobIdEvent {
  final String jobID;

  const SetJobId(this.jobID);

  @override
  List<Object> get props => [jobID];
}
