part of 'deneme_job_bloc.dart';

@immutable
abstract class DenemeJobState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDenemeJob extends DenemeJobState {
  final Job job;

  GetDenemeJob({required this.job});
  @override
  List<Object> get props => [job];
}
