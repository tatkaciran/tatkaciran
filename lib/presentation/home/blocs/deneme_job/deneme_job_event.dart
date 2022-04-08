part of 'deneme_job_bloc.dart';

@immutable
abstract class DenemeJobEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetDenemeJob extends DenemeJobEvent {
  final Job job;

  SetDenemeJob({required this.job});
  @override
  List<Object> get props => [job];
}
