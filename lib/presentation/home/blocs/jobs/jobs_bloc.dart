import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobs_repository/jobs_repository.dart';
part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobsRepository _jobsRepository;

  JobsBloc({required JobsRepository jobsRepository})
      : _jobsRepository = jobsRepository,
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
    Stream<List<Job>> _streamJobs = _jobsRepository.jobs();
    await for (List<Job> _jobs in _streamJobs) {
      emit(JobsState.loaded(_jobs));
      // add(JobsUpdated(_jobs));
    }
  }

  _onAddJob(AddJob event, Emitter<JobsState> emit) {
    _jobsRepository.addNewJob(
      event.job,
    );
  }

  _onUpdateJob(UpdateJob event, Emitter<JobsState> emit) {
    _jobsRepository.updateJob(event.updatedJob);
  }

  _onDeleteJob(DeleteJob event, Emitter<JobsState> emit) {
    _jobsRepository.deleteJob(event.job);
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
      _jobsRepository.updateJob(updatedJob);
    }
  }

  _onClearJobs(ClearJobs event, Emitter<JobsState> emit) {
    final currentState = state;

    final List<Job?> completedJobs =
        currentState.jobs!.where((job) => job!.isHidden!).toList();
    for (var completedJob in completedJobs) {
      _jobsRepository.deleteJob(completedJob!);
    }
  }

  _onJobsUpdate(JobsUpdated event, Emitter<JobsState> emit) {
    emit(JobsState.loaded(event.jobs));
  }
}
