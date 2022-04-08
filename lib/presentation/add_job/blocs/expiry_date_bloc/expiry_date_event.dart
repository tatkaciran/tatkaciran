part of 'expiry_date_bloc.dart';

abstract class ExpiryDateEvent extends Equatable {
  const ExpiryDateEvent();

  @override
  List<Object> get props => [];
}

class AddExpiryDate extends ExpiryDateEvent {
  final String expiryDate;

  const AddExpiryDate({required this.expiryDate});

  @override
  List<Object> get props => [expiryDate];
}
