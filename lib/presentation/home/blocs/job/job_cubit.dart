import 'package:bloc/bloc.dart';
import 'package:jobs_repository/jobs_repository.dart';

class JobCubit extends Cubit<Job> {
  JobCubit() : super(Job.empty);
  void add(Job job) => emit(job);
}
