import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobs_repository/jobs_repository.dart';
part 'user_jobs_event.dart';
part 'user_jobs_state.dart';

class UserJobsBloc extends Bloc<UserJobsEvent, UserJobsState> {
  final JobsRepository _userJobsRepository;

  UserJobsBloc({required JobsRepository jobsRepository})
      : _userJobsRepository = jobsRepository,
        super(const UserJobsState.loading()) {
    on<LoadUserJobs>(_onLoadMyJobs);

    on<UserJobsUpdated>(_onMyJobsUpdate);
  }

  _onLoadMyJobs(LoadUserJobs event, Emitter<UserJobsState> emit) async {
    Stream<List<Job>> _streamUserJobs =
        _userJobsRepository.myJobs(uid: event.uid);
    await for (List<Job> _userJobs in _streamUserJobs) {
      add(UserJobsUpdated(_userJobs));
    }
  }

  _onMyJobsUpdate(UserJobsUpdated event, Emitter<UserJobsState> emit) {
    emit(UserJobsState.loaded(event.jobs));
  }
}
