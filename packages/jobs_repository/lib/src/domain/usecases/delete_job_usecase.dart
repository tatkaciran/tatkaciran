import 'package:jobs_repository/jobs_repository.dart';

class DeleteJobUseCase<T extends JobEntity>
    implements UseCase<void, DeleteJobUseCaseParams<T>> {
  final JobsRepository<T> repository;

  DeleteJobUseCase(this.repository);

  @override
  Future<void> call(DeleteJobUseCaseParams<T> params) async {
    return repository.deleteJob(params.job);
  }
}

class DeleteJobUseCaseParams<T extends JobEntity> {
  final T job;

  DeleteJobUseCaseParams({required this.job});
}
