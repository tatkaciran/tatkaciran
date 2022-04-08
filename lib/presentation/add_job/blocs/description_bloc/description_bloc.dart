import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'description_event.dart';
part 'description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  DescriptionBloc() : super(const GetDescription(description: '')) {
    on<AddDecription>(
        (event, emit) => emit(GetDescription(description: event.description)));
  }
}
