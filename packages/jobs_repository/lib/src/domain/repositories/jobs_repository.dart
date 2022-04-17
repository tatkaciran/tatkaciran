import 'dart:async';

import 'package:jobs_repository/jobs_repository.dart';

abstract class JobsRepository<T extends JobEntity> {
  Future<void> addNewJob(T job);
  Future<void> deleteJob(T job);
  Future<Stream<List<T>>> jobs();
  Stream<List<T>> myJobs({required String uid});
  Future<void> updateJob(T job);
}
