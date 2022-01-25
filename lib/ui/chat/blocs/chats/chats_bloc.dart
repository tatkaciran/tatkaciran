import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:chats_repository/chats_repository.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatsRepository _chatsRepository;

  ChatsBloc({required ChatsRepository chatsRepository})
      : _chatsRepository = chatsRepository,
        super(ChatsLoaded([Chat.empty])) {
    on<LoadChats>(_onLoadChats);
    on<AddChat>(_onAddChat);
    on<UpdateChat>(_onUpdateChat);
    on<DeleteChat>(_onDeleteChat);
    on<HideChat>(_onHideChat);
    on<ChatsUpdated>(_onChatsUpdate);
  }

  Future<void> _onLoadChats(LoadChats event, Emitter<ChatsState> emit) async {
    Stream<List<Chat>> chatsStream = _chatsRepository.chats(
        jobID: event.jobID, employeeID: event.employeeID);

    await for (List<Chat> chats in chatsStream) {
      add(ChatsUpdated(chats));
    }
  }

  void _onAddChat(AddChat event, Emitter<ChatsState> emit) {
    _chatsRepository.addNewChat(
      chat: event.chat,
      jobID: event.jobID,
      employeeID: event.employeeID,
    );
  }

  void _onUpdateChat(UpdateChat event, Emitter<ChatsState> emit) {
    _chatsRepository.updateChat(
        chat: event.chat,
        jobID: event.jobID,
        employeeID: event.senderID,
        messageID: event.messageID);
  }

  void _onDeleteChat(DeleteChat event, Emitter<ChatsState> emit) {
    _chatsRepository.deleteChat(
        chat: event.chat, jobID: event.jobID, messageID: event.messageID);
  }

  void _onHideChat(HideChat event, Emitter<ChatsState> emit) {
    final currentState = state;
    if (currentState is ChatsLoaded) {
      final allHidden = currentState.chats.every((chat) => chat.isHidden!);
      final List<Chat> updatedChats = currentState.chats
          .map((chat) => chat.copyWith(isHidden: !allHidden))
          .toList();
      for (var updatedChat in updatedChats) {
        _chatsRepository.updateChat(chat: updatedChat);
      }
    }
  }

  void _onChatsUpdate(ChatsUpdated event, Emitter<ChatsState> emit) {
    emit(ChatsLoaded(event.chats));
  }
}
