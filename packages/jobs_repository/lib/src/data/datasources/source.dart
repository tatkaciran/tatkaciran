import 'package:jobs_repository/jobs_repository.dart';

abstract class DataSource<T extends JobEntity> extends JobsRepository<T> {
  SourceType get type;
}

enum RequestType { local, remote, any }
enum SourceType { local, remote }
