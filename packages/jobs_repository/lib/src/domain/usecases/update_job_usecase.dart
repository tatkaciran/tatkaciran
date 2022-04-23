import 'package:jobs_repository/jobs_repository.dart';

class UpdateJobUseCase<T extends JobEntity>
    implements UseCase<void, UpdateJobUseCaseParams<T>> {
  final JobsRepository<T> repository;

  UpdateJobUseCase(this.repository);

  @override
  Future<void> call(UpdateJobUseCaseParams<T> params) async {
    return repository.updateJob(params.job);
  }
}

class UpdateJobUseCaseParams<T extends JobEntity> {
  final T job;

  UpdateJobUseCaseParams({required this.job});
}
