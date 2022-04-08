part of 'description_bloc.dart';

abstract class DescriptionEvent extends Equatable {
  const DescriptionEvent();

  @override
  List<Object> get props => [];
}

class AddDecription extends DescriptionEvent {
  final String description;

  const AddDecription({required this.description});

  @override
  List<Object> get props => [description];
}
