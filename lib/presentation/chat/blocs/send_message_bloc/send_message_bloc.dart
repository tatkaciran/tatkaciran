import 'package:bloc/bloc.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageState.empty());

  void add(SendMessageState state) => emit(state);
}

class SendMessageState {
  final String content;
  final String jobID;
  final String displayName;
  final String employeeID;
  final String employerID;
  final String userID;

  SendMessageState({
    this.content = '',
    this.jobID = '',
    this.displayName = '',
    this.employeeID = '',
    this.employerID = '',
    this.userID = '',
  });

  factory SendMessageState.empty() {
    return SendMessageState(
      content: '',
      displayName: '',
      employeeID: '',
      employerID: '',
      jobID: '',
      userID: '',
    );
  }
  SendMessageState copyWith({
    String? content,
    String? jobID,
    String? displayName,
    String? employeeID,
    String? employerID,
    String? userID,
  }) {
    return SendMessageState(
      content: content ?? this.content,
      displayName: displayName ?? this.displayName,
      employeeID: employeeID ?? this.employeeID,
      employerID: employerID ?? this.employerID,
      jobID: jobID ?? this.jobID,
      userID: userID ?? this.userID,
    );
  }
}
