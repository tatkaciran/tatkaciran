part of 'job_bloc.dart';

@immutable
abstract class JobBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetJobEvent extends JobBlocEvent {
  final Job job;

  SetJobEvent({required this.job});

  @override
  List<Object> get props => [job];
}
