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

class DeleteJob extends JobsEvent {
  final Job job;

  const DeleteJob(this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'DeleteJob { job: $job }';
}
