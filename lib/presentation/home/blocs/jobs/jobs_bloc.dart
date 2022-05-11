import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_repository/jobs_repository.dart';
part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsPresenter {
  JobsBloc jobsBloc(List<DataSource<Job>> sources) {
    var _jobsRepository = JobsRepositoryImpl<Job>(sources);
    var _jobsBloc = JobsBloc(
      getJobsUseCase: GetJobsUseCase(_jobsRepository),
      addNewJobUseCase: AddNewJobUseCase(_jobsRepository),
      deleteJobUseCase: DeleteJobUseCase(_jobsRepository),
      updateJobUseCase: UpdateJobUseCase(_jobsRepository),
    );
    return _jobsBloc;
  }
}

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final GetJobsUseCase<Job> _getJobsUseCase;
  final AddNewJobUseCase<Job> _addNewJobUseCase;
  final DeleteJobUseCase<Job> _deleteJobUseCase;
  final UpdateJobUseCase<Job> _updateJobUseCase;
  JobsBloc({
    required GetJobsUseCase<Job> getJobsUseCase,
    required AddNewJobUseCase<Job> addNewJobUseCase,
    required DeleteJobUseCase<Job> deleteJobUseCase,
    required UpdateJobUseCase<Job> updateJobUseCase,
  })  : _getJobsUseCase = getJobsUseCase,
        _addNewJobUseCase = addNewJobUseCase,
        _deleteJobUseCase = deleteJobUseCase,
        _updateJobUseCase = updateJobUseCase,
        super(const JobsState.notLoaded()) {
    on<LoadJobs>(_onLoadJobs);
    on<AddJob>(_onAddJob);
    on<UpdateJob>(_onUpdateJob);
    on<DeleteJob>(_onDeleteJob);
  }

  _onLoadJobs(LoadJobs event, Emitter<JobsState> emit) async {
    emit(const JobsState.loading());
    Stream<List<Job>> _streamJobs = await _getJobsUseCase(NoParams());
    await for (List<Job> _jobs in _streamJobs) {
      emit(JobsState.loaded(_jobs));
    }
  }

  _onAddJob(AddJob event, Emitter<JobsState> emit) {
    var _addNewJobUseCaseParams = AddNewJobUseCaseParams(job: event.job);
    _addNewJobUseCase(_addNewJobUseCaseParams);
  }

  _onUpdateJob(UpdateJob event, Emitter<JobsState> emit) {
    var _updateJobUseCaseParams = UpdateJobUseCaseParams(job: event.updatedJob);
    _updateJobUseCase(_updateJobUseCaseParams);
  }

  _onDeleteJob(DeleteJob event, Emitter<JobsState> emit) {
    var _deleteJobUseCaseParams = DeleteJobUseCaseParams(job: event.job);
    _deleteJobUseCase(_deleteJobUseCaseParams);
  }
}
