import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_repository/jobs_repository.dart';

class FirebaseJobsRepository implements JobsRepository {
  final jobCollection = FirebaseFirestore.instance.collection('jobs');

  @override
  Future<void> addNewJob(Job job) {
    return jobCollection.add(job.toEntity().toDocument());
  }

  @override
  Future<void> deleteJob(Job job) async {
    return jobCollection.doc(job.jobID).delete();
  }

  @override
  Stream<List<Job>> jobs() async* {
    Stream<QuerySnapshot> snapshots = jobCollection.snapshots();

    await for (QuerySnapshot snapshot in snapshots) {
      List<Job> _jobs = [];

      for (QueryDocumentSnapshot doc in snapshot.docs) {
        print(doc.metadata.isFromCache ? "Cached asds" : "Not Cached");
        Job _job = Job.fromEntity(JobEntity.fromSnapshot(doc));

        _jobs.add(_job);
      }

      yield _jobs;
    }
  }

  // @override
  // Stream<List<Job>> jobs({String where = 'planet', String what = 'earth'}) {
  //   return jobCollection
  //       .where('address.$where', isEqualTo: '$what')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs
  //         .map((doc) => Job.fromEntity(JobEntity.fromSnapshot(doc)))
  //         .toList();
  //   });
  // }

  @override
  Stream<List<Job>> myJobs({required String uid}) async* {
    Stream<QuerySnapshot> snapshots =
        jobCollection.where('user_id', isEqualTo: uid).snapshots();
    await for (QuerySnapshot snapshot in snapshots) {
      List<Job> _myJobs = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        print(doc.metadata.isFromCache ? "Cached" : "Not Cached");
        Job _job = Job.fromEntity(JobEntity.fromSnapshot(doc));
        _myJobs.add(_job);
      }
      yield _myJobs;
    }
  }

  // @override
  // Stream<List<Job>> myJobs({String uid}) {
  //   return jobCollection
  //       .where(uid, isEqualTo: 'user_id')
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs
  //         .map((doc) => Job.fromEntity(JobEntity.fromSnapshot(doc)))
  //         .toList();
  //   });
  // }

  @override
  Future<void> updateJob(Job update) {
    return jobCollection.doc(update.jobID).set(update.toEntity().toDocument());
  }
}
