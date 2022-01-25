part of 'chats_bloc.dart';

@immutable
abstract class ChatsEvent extends Equatable {
  const ChatsEvent();
  @override
  List<Object> get props => [];
}

class LoadChats extends ChatsEvent {
  final String employeeID;
  final String jobID;

  const LoadChats({
    required this.employeeID,
    required this.jobID,
  });

  @override
  List<Object> get props => [jobID, employeeID];

  @override
  String toString() =>
      'ChatLoadChatssEvent { jobID: $jobID, employeeID: $employeeID }';
}

class IsReadChats extends ChatsEvent {
  final String employeeID;
  final String jobID;

  const IsReadChats({
    required this.employeeID,
    required this.jobID,
  });

  @override
  List<Object> get props => [jobID, employeeID];

  @override
  String toString() => 'IsReadChats { jobID: $jobID, employeeID: $employeeID }';
}

class AddChat extends ChatsEvent {
  final Chat chat;
  final String employeeID;
  final String jobID;

  const AddChat({
    required this.chat,
    required this.employeeID,
    required this.jobID,
  });

  @override
  List<Object> get props => [chat, jobID, employeeID];

  @override
  String toString() =>
      'AddChat { chat: $chat, jobID: $jobID, employeeID: $employeeID }';
}

class UpdateChat extends ChatsEvent {
  final Chat chat;
  final String senderID;
  final String jobID;
  final String messageID;

  const UpdateChat({
    required this.chat,
    required this.senderID,
    required this.jobID,
    required this.messageID,
  });

  @override
  List<Object> get props => [chat, senderID, jobID, messageID];

  @override
  String toString() => 'UpdateChat { chat: $chat }';
}

class DeleteChat extends ChatsEvent {
  final Chat chat;
  final String senderID;
  final String jobID;
  final String messageID;

  const DeleteChat({
    required this.chat,
    required this.senderID,
    required this.jobID,
    required this.messageID,
  });

  @override
  List<Object> get props => [chat, senderID, jobID, messageID];

  @override
  String toString() => 'DeleteChat { chat: $chat }';
}

class HideChat extends ChatsEvent {
  final Chat chat;

  const HideChat(this.chat);

  @override
  List<Object> get props => [chat];

  @override
  String toString() => 'DeleteChat { chat: $chat }';
}

class ChatsUpdated extends ChatsEvent {
  final List<Chat> chats;

  const ChatsUpdated(this.chats);

  @override
  List<Object> get props => [chats];
}
