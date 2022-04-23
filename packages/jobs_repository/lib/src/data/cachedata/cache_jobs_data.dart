import 'dart:async';

import 'package:jobs_repository/jobs_repository.dart';

class CacheJobsData<T extends JobEntity> extends CacheData<T> {
  CacheJobsData(List<DataSource<T>> sources)
      : _sources = sources,
        _cachedSources = <DataSource<T>>[];

  final List<DataSource<T>> _sources;
  final List<DataSource<T>> _cachedSources;
  late Stream<List<T>> _jobsStream;

  bool isMatchedSource(DataSource source,
      [RequestType type = RequestType.any]) {
    if (type == RequestType.any) return true;
    return source.type == SourceType.local
        ? type == RequestType.local
        : type == RequestType.remote;
  }

  Future<Stream<List<T>>> cacheJobsAndRetriveCachedJobs() async {
    sourcesLoop:
    for (final source in _sources) {
      if (!isMatchedSource(source, RequestType.any)) {
        _cachedSources.add(source);
        continue;
      }

      _jobsStream = await source.jobs();

      await for (var jobs in (await source.jobs()).asBroadcastStream()) {
        if (jobs.isEmpty) {
          _cachedSources.add(source);
          continue sourcesLoop;
        }
        if (jobs.isNotEmpty && _cachedSources.isNotEmpty) {
          for (var job in jobs) {
            for (var _cachedSource in _cachedSources) {
              _cachedSource.addNewJob(job);
              continue;
            }
            continue;
          }
          continue sourcesLoop;
        }
      }
    }

    return _jobsStream;
  }
}
