part of 'expiry_date_bloc.dart';

abstract class ExpiryDateState extends Equatable {
  const ExpiryDateState();

  @override
  List<Object> get props => [];
}

class GetExpiryDate extends ExpiryDateState {
  final int expiryDate;

  const GetExpiryDate({required this.expiryDate});

  @override
  List<Object> get props => [expiryDate];
}
