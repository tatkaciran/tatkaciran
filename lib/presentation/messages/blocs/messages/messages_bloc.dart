import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:instajobs/constants/constants.dart';

import 'package:messages_repository/messages_repository.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  final MessagesRepository _messagesRepository;

  MessagesBloc({
    required MessagesRepository messagesRepository,
  })  : _messagesRepository = messagesRepository,
        super(const MessagesState.loading()) {
    on<LoadMessages>(_onLoadMessages);
    on<AddMessage>(_onAddMessage);
    on<UpdateMessage>(_onUpdateMessage);
    on<DeleteMessage>(_onDeleteMessage);
    on<HiddenAll>(_onHiddenAll);
    on<ClearMessages>(_onClearMessages);
    on<MessagesUpdated>(_onMessagesUpdate);
  }

  Future<void> _onLoadMessages(
      LoadMessages event, Emitter<MessagesState> emit) async {
    await for (List<Message> messages
        in _messagesRepository.messages(event.userID)) {
      add(MessagesUpdated(messages));
    }
  }

  void _onAddMessage(AddMessage event, Emitter<MessagesState> emit) {
    _messagesRepository.addNewMessage(
      jobID: event.jobID,
      message: event.message,
      employeeID: event.employeeID,
    );
  }

  void _onUpdateMessage(UpdateMessage event, Emitter<MessagesState> emit) {
    _messagesRepository.updateMessage(
      employeeID: event.employeeID,
      jobID: event.jobID,
      message: event.message,
    );
  }

  void _onDeleteMessage(DeleteMessage event, Emitter<MessagesState> emit) {
    _messagesRepository.deleteMessage(event.message);
  }

  void _onHiddenAll(HiddenAll event, Emitter<MessagesState> emit) {
    final currentState = state;

    final allHidden = currentState.messages
        ?.every((message) => (message ?? Message.empty).isHidden ?? false);
    final List<Message> updatedMessages = (currentState.messages ?? [])
        .map((message) =>
            (message ?? Message.empty).copyWith(isHidden: !allHidden!))
        .toList();
    for (var updatedMessage in updatedMessages) {
      _messagesRepository.updateMessage(
        employeeID: updatedMessage.employeeID,
        jobID: updatedMessage.jobID,
        message: updatedMessage,
      );
    }
  }

  void _onClearMessages(ClearMessages event, Emitter<MessagesState> emit) {
    final currentState = state;

    final List<Message?> clearMessages = (currentState.messages ?? [])
        .where((message) => (message ?? Message.empty).isHidden ?? false)
        .toList();
    for (var clearMessage in clearMessages) {
      _messagesRepository.deleteMessage(clearMessage!);
    }
  }

  void _onMessagesUpdate(MessagesUpdated event, Emitter<MessagesState> emit) {
    // add(MessagesIsRead(isReads: event.messages));

    emit(MessagesState.loaded(event.messages));
  }
}
