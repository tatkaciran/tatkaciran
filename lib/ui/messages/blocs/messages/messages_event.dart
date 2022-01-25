part of 'messages_bloc.dart';

@immutable
abstract class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

class LoadMessages extends MessagesEvent {
  final String userID;
  const LoadMessages(this.userID);
}

class QuickLoadMessages extends MessagesEvent {
  final String jobID;
  const QuickLoadMessages({required this.jobID});
}

class MessagesIsRead extends MessagesEvent {
  final List<Message> isReads;
  const MessagesIsRead({required this.isReads});
}

class AddMessage extends MessagesEvent {
  final Message message;
  final String employeeID;
  final String jobID;

  const AddMessage({
    required this.message,
    required this.employeeID,
    required this.jobID,
  });

  @override
  List<Object> get props => [message, employeeID, jobID];

  @override
  String toString() =>
      'AddMessage { message: $message, employeeID: $employeeID, jobID: $jobID }';
}

class UpdateMessage extends MessagesEvent {
  final Message message;
  final String employeeID;
  final String jobID;

  const UpdateMessage({
    required this.message,
    required this.employeeID,
    required this.jobID,
  });

  @override
  List<Object> get props => [message, employeeID, jobID];

  @override
  String toString() =>
      'UpdateMessage { message: $message, employeeID: $employeeID, jobID: $jobID }';
}

class DeleteMessage extends MessagesEvent {
  final Message message;

  const DeleteMessage(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'DeleteMessage { message: $message }';
}

class ClearMessages extends MessagesEvent {}

class HiddenAll extends MessagesEvent {}

class MessagesUpdated extends MessagesEvent {
  final List<Message> messages;

  const MessagesUpdated(this.messages);

  @override
  List<Object> get props => [messages];
}
