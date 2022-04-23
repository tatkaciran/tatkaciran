import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_repository/jobs_repository.dart';

class RemoteJobsFirebaseDataSource<T extends JobEntity>
    implements DataSource<T> {
  final jobCollection = FirebaseFirestore.instance.collection('jobs');

  @override
  Future<void> addNewJob(T job) {
    print('''job cached in Remote-Jobs-Firebase-DataSource''');
    return jobCollection.add((job as Job).toDocument());
  }

  @override
  Future<void> deleteJob(T job) async {
    return jobCollection.doc(job.jobID).delete();
  }

  @override
  Future<Stream<List<T>>> jobs() async {
    print('get Jobs in Remote-Jobs-Firebase-DataSource');
    return _jobsStream();
  }

  Stream<List<T>> _jobsStream() async* {
    Stream<QuerySnapshot> snapshots = jobCollection.snapshots();

    await for (QuerySnapshot snapshot in snapshots) {
      List<T> _jobs = [];

      for (QueryDocumentSnapshot doc in snapshot.docs) {
        Job _job = Job.fromSnapshot(doc);
        // print(doc.metadata.isFromCache ? "Cached: $_job" : "Not Cached");

        _jobs.add(_job as T);
      }

      yield _jobs;
    }
  }

  @override
  Stream<List<T>> myJobs({required String uid}) async* {
    Stream<QuerySnapshot> snapshots =
        jobCollection.where('user_id', isEqualTo: uid).snapshots();
    await for (QuerySnapshot snapshot in snapshots) {
      List<T> _myJobs = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        print(doc.metadata.isFromCache ? "Cached" : "Not Cached");
        Job _job = Job.fromSnapshot(doc);
        _myJobs.add(_job as T);
      }
      yield _myJobs;
    }
  }

  @override
  Future<void> updateJob(T update) {
    return jobCollection.doc(update.jobID).set((update as Job).toDocument());
  }

  @override
  SourceType get type => SourceType.remote;
}
