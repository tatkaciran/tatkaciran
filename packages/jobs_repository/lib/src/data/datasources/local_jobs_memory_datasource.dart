import 'package:jobs_repository/jobs_repository.dart';

class LocalJobsMemoryDataSource<T extends JobEntity> implements DataSource<T> {
  LocalJobsMemoryDataSource();

  final Map<String, T> _items = <String, T>{};
  @override
  Future<void> addNewJob(T job) async {
    print('''job cached in Local-Jobs-Memory-DataSource''');
    _items[job.jobID] = job;
  }

  @override
  Future<void> deleteJob(T job) async => _items.remove(job.jobID);

  @override
  Future<Stream<List<T>>> jobs() async {
    print('get Jobs in Local-Jobs-Memory-DataSource');
    Stream<List<T>> jobsStream = Stream<List<T>>.value(_items.values.toList());
    return jobsStream;
  }

  @override
  Stream<List<T>> myJobs({required String uid}) async* {
    yield _items.values.toList();
  }

  @override
  Future<void> updateJob(T update) async => _items[update.jobID] = update;

  @override
  SourceType get type => SourceType.local;
}
