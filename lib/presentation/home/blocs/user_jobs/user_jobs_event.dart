part of 'user_jobs_bloc.dart';

abstract class UserJobsEvent extends Equatable {
  const UserJobsEvent();

  @override
  List<Object> get props => [];
}

class LoadUserJobs extends UserJobsEvent {
  final String uid;

  const LoadUserJobs({required this.uid});
  @override
  List<Object> get props => [uid];
}

class UserJobsUpdated extends UserJobsEvent {
  final List<Job> jobs;

  const UserJobsUpdated(this.jobs);

  @override
  List<Object> get props => [jobs];
}
