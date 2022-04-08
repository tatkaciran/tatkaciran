part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class LoadJobs extends JobsEvent {
  const LoadJobs();
  @override
  List<Object> get props => [];
}

class AddJob extends JobsEvent {
  final Job job;

  const AddJob(this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'AddJob { job: $job}';
}

class UpdateJob extends JobsEvent {
  final Job updatedJob;

  const UpdateJob(this.updatedJob);

  @override
  List<Object> get props => [updatedJob];

  @override
  String toString() => 'UpdateJob { updatedJob: $updatedJob }';
}

class HideJob extends JobsEvent {
  final Job job;

  const HideJob(this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'UpdateJob { job: $job }';
}

class DeleteJob extends JobsEvent {
  final Job job;

  const DeleteJob(this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'DeleteJob { job: $job }';
}

class ClearJobs extends JobsEvent {}

class HiddenAll extends JobsEvent {}

class JobsUpdated extends JobsEvent {
  final List<Job> jobs;

  const JobsUpdated(this.jobs);

  @override
  List<Object> get props => [jobs];
}
