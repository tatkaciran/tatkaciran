part of 'jobs_bloc.dart';

class JobsState {
  final List<Job?>? jobs;

  const JobsState.loading() : jobs = null;
  const JobsState.notLoaded() : jobs = null;
  const JobsState.loaded(List<Job?>? loadedJobs) : jobs = loadedJobs;

  @override
  String toString() => 'Jobs { jobs: $jobs }';
}
