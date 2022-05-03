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
        super(const JobsState.loading()) {
    on<LoadJobs>(_onLoadJobs);
    on<AddJob>(_onAddJob);
    on<UpdateJob>(_onUpdateJob);
    on<DeleteJob>(_onDeleteJob);
    on<HiddenAll>(_onHiddenAll);
    on<ClearJobs>(_onClearJobs);
    on<JobsUpdated>(_onJobsUpdate);
  }

  _onLoadJobs(LoadJobs event, Emitter<JobsState> emit) async {
    Stream<List<Job>> _streamJobs = await _getJobsUseCase(NoParams());
    await for (List<Job> _jobs in _streamJobs) {
      emit(JobsState.loaded(_jobs));
      // add(JobsUpdated(_jobs));
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

  _onHiddenAll(HiddenAll event, Emitter<JobsState> emit) {
    final currentState = state;

    final allHidden = currentState.jobs?.every((job) => job!.isHidden!);
    final List<Job> updatedJobs = currentState.jobs!
        .map((job) => job!.copyWith(
              isHidden: !allHidden!,
            ))
        .toList();
    for (var updatedJob in updatedJobs) {
      var _updateJobUseCaseParams =
          UpdateJobUseCaseParams<Job>(job: updatedJob);
      _updateJobUseCase(_updateJobUseCaseParams);
    }
  }

  _onClearJobs(ClearJobs event, Emitter<JobsState> emit) {
    final currentState = state;

    final List<Job?> completedJobs =
        currentState.jobs!.where((job) => job!.isHidden!).toList();
    for (var completedJob in completedJobs) {
      var _deleteJobUseCaseParams =
          DeleteJobUseCaseParams<Job>(job: completedJob!);
      _deleteJobUseCase(_deleteJobUseCaseParams);
    }
  }

  _onJobsUpdate(JobsUpdated event, Emitter<JobsState> emit) {
    emit(JobsState.loaded(event.jobs));
  }
}
