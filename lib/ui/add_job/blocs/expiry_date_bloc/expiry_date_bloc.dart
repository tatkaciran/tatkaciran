import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'expiry_date_event.dart';
part 'expiry_date_state.dart';

class ExpiryDateBloc extends Bloc<ExpiryDateEvent, ExpiryDateState> {
  ExpiryDateBloc() : super(const GetExpiryDate(expiryDate: 0)) {
    on<AddExpiryDate>((event, emit) =>
        emit(GetExpiryDate(expiryDate: int.parse(event.expiryDate))));
  }
}
