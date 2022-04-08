part of 'in_chat_job_details_bloc.dart';

abstract class InChatJobDetailsEvent extends Equatable {
  const InChatJobDetailsEvent();

  @override
  List<Object> get props => [];
}

class SetJobID extends InChatJobDetailsEvent {
  final String jobID;

  const SetJobID(this.jobID);

  @override
  List<Object> get props => [jobID];
}

class SetJob extends InChatJobDetailsEvent {
  final Job job;

  const SetJob(this.job);

  @override
  List<Object> get props => [job];
}
