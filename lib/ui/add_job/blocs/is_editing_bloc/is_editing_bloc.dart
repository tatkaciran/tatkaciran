import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'is_editing_event.dart';
part 'is_editing_state.dart';

class IsEditingBloc extends Bloc<IsEditingEvent, IsEditingState> {
  IsEditingBloc() : super(const GetIsEditing(isEditing: false)) {
    on<AddIsEditing>(
        (event, emit) => emit(GetIsEditing(isEditing: event.isEditing)));
  }
}
