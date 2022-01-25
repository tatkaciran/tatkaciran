part of 'is_editing_bloc.dart';

abstract class IsEditingState extends Equatable {
  const IsEditingState();

  @override
  List<Object> get props => [];
}

class GetIsEditing extends IsEditingState {
  final bool isEditing;

  const GetIsEditing({required this.isEditing});

  @override
  List<Object> get props => [isEditing];
}
