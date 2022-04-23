import 'package:jobs_repository/jobs_repository.dart';

class AddNewJobUseCase<T extends JobEntity>
    implements UseCase<void, AddNewJobUseCaseParams<T>> {
  final JobsRepository<T> repository;

  AddNewJobUseCase(this.repository);

  @override
  Future<void> call(AddNewJobUseCaseParams<T> params) async {
    return repository.addNewJob(params.job);
  }
}

class AddNewJobUseCaseParams<T extends JobEntity> {
  final T job;

  AddNewJobUseCaseParams({required this.job});
}
