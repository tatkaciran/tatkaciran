import 'package:jobs_repository/jobs_repository.dart';

class GetJobsUseCase<T extends JobEntity>
    implements UseCase<Stream<List<T>>, NoParams> {
  final JobsRepository<T> repository;

  GetJobsUseCase(this.repository);

  @override
  Future<Stream<List<T>>> call(NoParams params) async {
    return repository.jobs();
  }
}
