import 'package:jobs_repository/jobs_repository.dart';

class GetJobsByIdUseCase<T extends JobEntity>
    implements UseCase<Stream<List<T>>, GetJobsByIdUseCaseParams> {
  final JobsRepository<T> repository;

  GetJobsByIdUseCase(this.repository);

  @override
  Future<Stream<List<T>>> call(GetJobsByIdUseCaseParams params) async {
    return repository.myJobs(uid: params.uid);
  }
}

class GetJobsByIdUseCaseParams {
  final String uid;

  GetJobsByIdUseCaseParams({required this.uid});
}
