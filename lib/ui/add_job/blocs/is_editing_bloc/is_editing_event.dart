part of 'is_editing_bloc.dart';

abstract class IsEditingEvent extends Equatable {
  const IsEditingEvent();

  @override
  List<Object> get props => [];
}

class AddIsEditing extends IsEditingEvent {
  final bool isEditing;

  const AddIsEditing({required this.isEditing});

  @override
  List<Object> get props => [isEditing];
}
