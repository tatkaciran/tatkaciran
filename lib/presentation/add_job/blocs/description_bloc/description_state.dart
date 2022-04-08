part of 'description_bloc.dart';

abstract class DescriptionState extends Equatable {
  const DescriptionState();

  @override
  List<Object> get props => [];
}

class GetDescription extends DescriptionState {
  final String description;

  const GetDescription({required this.description});

  @override
  List<Object> get props => [description];
}
