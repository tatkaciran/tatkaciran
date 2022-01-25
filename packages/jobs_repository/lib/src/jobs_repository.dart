import 'dart:async';

import 'package:jobs_repository/jobs_repository.dart';

abstract class JobsRepository {
  Future<void> addNewJob(Job job);
  Future<void> deleteJob(Job job);
  Stream<List<Job>> jobs();
  Stream<List<Job>> myJobs({required String uid});
  Future<void> updateJob(Job job);
}
