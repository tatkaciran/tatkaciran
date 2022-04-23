import 'package:hive/hive.dart';
import 'package:jobs_repository/jobs_repository.dart';

class LocalJobsHiveDataSource<T extends JobEntity> implements DataSource<T> {
  LocalJobsHiveDataSource({
    required this.fromJson,
    required this.toJson,
  });

  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic> Function(T) toJson;

  // <String, T>
  late Box _jobsBox;

  Future<void> ready() async {
    _jobsBox = await Hive.openBox(_jobsBoxName);
  }

  Future<void> clear() async {
    _jobsBox.clear();
  }

  String get _jobsBoxName => '${T.toString()}-items';

  @override
  Future<void> addNewJob(T job) async {
    print('''job cached in Local-Jobs-Hive-DataSource''');
    _jobsBox.put(job.jobID, toJson(job));
  }

  @override
  Future<void> deleteJob(T job) async => _jobsBox.delete(job.jobID);

  @override
  Future<Stream<List<T>>> jobs() async {
    print('get Jobs in Local-Jobs-Hive-DataSource');
    Stream<List<T>> jobsStream = Stream<List<T>>.value(_jobsBox.values
        .map<T>((data) => fromJson(data.cast<String, dynamic>()))
        .toList());
    return jobsStream;
  }

  @override
  Stream<List<T>> myJobs({required String uid}) async* {
    print('get Jobs in Local-Jobs-Hive-DataSource');
    Stream<List<T>> jobsStream = Stream<List<T>>.value(_jobsBox.values
        .map<T>((data) => fromJson(data.cast<String, dynamic>()))
        .toList());
    yield* jobsStream;
  }

  @override
  Future<void> updateJob(T update) async =>
      _jobsBox.put(update.jobID, toJson(update));

  @override
  SourceType get type => SourceType.local;
}
