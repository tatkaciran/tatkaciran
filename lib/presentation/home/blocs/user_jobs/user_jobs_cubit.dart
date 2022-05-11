import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jobs_repository/jobs_repository.dart';

class UserJobsCubit extends Cubit<List<Job>> {
  final GetJobsByIdUseCase<Job> getJobsByIdUseCase;

  UserJobsCubit({required this.getJobsByIdUseCase}) : super(const []);

  Future<void> add(String uid) async {
    GetJobsByIdUseCaseParams params = GetJobsByIdUseCaseParams(uid: uid);

    Stream<List<Job>> _streamUserJobs = await getJobsByIdUseCase.call(params);
    await for (List<Job> _userJobs in _streamUserJobs) {
      emit(_userJobs);
    }
  }
}
