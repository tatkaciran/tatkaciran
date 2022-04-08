part of 'messages_bloc.dart';

class MessagesState {
  final List<Message?>? messages;

  const MessagesState.loading() : messages = const [];
  const MessagesState.notLoaded() : messages = const [];
  const MessagesState.loaded(List<Message?>? loadedMessages)
      : messages = loadedMessages;

  @override
  String toString() => 'MessagesLoaded { messages: $messages }';
}


// @immutable
// abstract class MessagesState extends Equatable {
//   const MessagesState();

//   @override
//   List<Object> get props => [];
// }

// class MessagesLoading extends MessagesState {}

// class MessagesLoaded extends MessagesState {
//   final List<Message?>? messages;

//   const MessagesLoaded([this.messages]);

//   @override
//   String toString() => 'MessagesLoaded { messages: $messages }';
// }

// class MessagesNotLoaded extends MessagesState {}
