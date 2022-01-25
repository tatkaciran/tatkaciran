import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:meta/meta.dart';

part 'deneme_job_event.dart';
part 'deneme_job_state.dart';

class DenemeJobBloc extends Bloc<DenemeJobEvent, DenemeJobState> {
  DenemeJobBloc() : super(GetDenemeJob(job: Job.empty)) {
    on<SetDenemeJob>((event, emit) => emit(GetDenemeJob(job: event.job)));
  }
}
