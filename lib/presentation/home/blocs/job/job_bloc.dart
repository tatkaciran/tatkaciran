import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:meta/meta.dart';

part 'job_event.dart';

class JobBloc extends Bloc<JobBlocEvent, Job> {
  JobBloc() : super(Job.empty) {
    on<SetJobEvent>((event, emit) => emit(event.job));
  }
}
