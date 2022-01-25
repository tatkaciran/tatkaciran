part of 'address_bloc.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class GetAddress extends AddressState {
  final String address;

  const GetAddress({required this.address});

  @override
  List<Object> get props => [address];
}
