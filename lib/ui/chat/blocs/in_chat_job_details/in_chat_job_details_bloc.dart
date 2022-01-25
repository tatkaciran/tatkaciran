import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:jobs_repository/jobs_repository.dart';

part 'in_chat_job_details_event.dart';
part 'in_chat_job_details_state.dart';

class InChatJobDetailsBloc
    extends Bloc<InChatJobDetailsEvent, InChatJobDetailsState> {
  InChatJobDetailsBloc() : super(GetJob(Job.empty)) {
    on<SetJobID>(_onSetJobID);
    on<SetJob>(_onSetJob);
  }

  void _onSetJobID(SetJobID event, Emitter<InChatJobDetailsState> emit) {
    FirebaseFirestore.instance
        .collection('jobs')
        .doc(event.jobID)
        .snapshots()
        .listen(
      (doc) {
        Job job = Job.fromEntity(JobEntity.fromSnapshot(doc));
        add(SetJob(job));
      },
      cancelOnError: true,
    );
  }

  void _onSetJob(SetJob event, Emitter<InChatJobDetailsState> emit) {
    emit(GetJob(event.job));
  }
}
