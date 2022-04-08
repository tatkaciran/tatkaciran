import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'job_id_event.dart';
part 'job_id_state.dart';

class JobIdBloc extends Bloc<JobIdEvent, JobIdState> {
  JobIdBloc() : super(const GetJobId('')) {
    on<SetJobId>((event, emit) => emit(GetJobId(event.jobID)));
  }
}
