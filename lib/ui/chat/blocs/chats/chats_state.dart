part of 'chats_bloc.dart';

@immutable
abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

class ChatsLoading extends ChatsState {}

class ChatsLoaded extends ChatsState {
  final List<Chat> chats;

  const ChatsLoaded([this.chats = const []]);

  @override
  List<Object> get props => [chats];

  @override
  String toString() => 'ChatsLoaded { chats: $chats }';
}

class ChatsNotLoaded extends ChatsState {}
