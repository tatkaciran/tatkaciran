import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/domain.dart';
import '../data.dart';

class JobsRepositoryImpl<T extends JobEntity> implements JobsRepository<T> {
  final jobCollection = FirebaseFirestore.instance.collection('jobs');
  final List<DataSource<T>> _sources;

  JobsRepositoryImpl(List<DataSource<T>> sources) : _sources = sources;

  bool isMatchedSource(DataSource source,
      [RequestType type = RequestType.any]) {
    if (type == RequestType.any) return true;
    return source.type == SourceType.local
        ? type == RequestType.local
        : type == RequestType.remote;
  }

  @override
  Future<void> addNewJob(T job) async {
    for (var source in _sources) {
      return source.addNewJob(job);
    }
  }

  @override
  Future<void> deleteJob(T job) async {
    for (var source in _sources) {
      return source.deleteJob(job);
    }
  }

  @override
  Future<Stream<List<T>>> jobs() async {
    CacheJobsData<T> _cacheJobsData = CacheJobsData<T>(_sources);
    return await _cacheJobsData.cacheJobsAndRetriveCachedJobs();
  }

  @override
  Stream<List<T>> myJobs({required String uid}) async* {
    for (var source in _sources) {
      yield* source.myJobs(uid: uid);
    }
  }

  @override
  Future<void> updateJob(T update) async {
    for (var source in _sources) {
      return source.updateJob(update);
    }
  }
}
