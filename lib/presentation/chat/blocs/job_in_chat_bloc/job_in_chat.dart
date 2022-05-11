import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:jobs_repository/jobs_repository.dart';

class JobInChatBloc extends Cubit<Job> {
  JobInChatBloc() : super(Job.empty);

  void add(String jobID) {
    FirebaseFirestore.instance.collection('jobs').doc(jobID).snapshots().listen(
      (doc) {
        Job job = Job.fromSnapshot(doc);
        emit(job);
      },
      cancelOnError: true,
    );
  }
}
