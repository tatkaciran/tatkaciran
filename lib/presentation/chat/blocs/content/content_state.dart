part of 'content_bloc.dart';

@immutable
abstract class ContentState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetContent extends ContentState {
  final String content;

  GetContent(this.content);

  @override
  List<Object> get props => [content];
}
