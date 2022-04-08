part of 'content_bloc.dart';

@immutable
abstract class ContentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SetContent extends ContentEvent {
  final String content;

  SetContent(this.content);

  @override
  List<Object> get props => [content];
}
