part of 'user_jobs_bloc.dart';

class UserJobsState extends Equatable {
  final List<Job> jobs;

  const UserJobsState([this.jobs = const []]);

  const UserJobsState.loading() : jobs = const [];
  const UserJobsState.notLoaded() : jobs = const [];
  const UserJobsState.loaded(List<Job> loadedJobs) : jobs = loadedJobs;

  @override
  List<Object> get props => [jobs];

  @override
  String toString() => 'UserJobsLoaded { jobs: $jobs }';
}
