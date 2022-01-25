import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(const GetAddress(address: '')) {
    on<AddAddress>((event, emit) => emit(GetAddress(address: event.address)));
  }
}
