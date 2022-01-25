part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class AddAddress extends AddressEvent {
  final String address;

  const AddAddress({required this.address});

  @override
  List<Object> get props => [address];
}
