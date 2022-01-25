part of 'jobs_bloc.dart';

class JobsState {
  final List<Job?>? jobs;

  const JobsState.loading() : jobs = null;
  const JobsState.notLoaded() : jobs = null;
  const JobsState.loaded(List<Job?>? loadedJobs) : jobs = loadedJobs;

  @override
  String toString() => 'Jobs { jobs: $jobs }';
}

// abstract class JobsState extends Equatable {
//   const JobsState();

//   @override
//   List<Object> get props => [];
// }

// class JobsLoading extends JobsState {}

// class JobsLoaded extends JobsState {
//   final List<Job> jobs;

//   const JobsLoaded([this.jobs = const []]);

//   @override
//   List<Object> get props => [jobs];

//   @override
//   String toString() => 'JobsLoaded { jobs: $jobs }';
// }

// class JobsNotLoaded extends JobsState {}
