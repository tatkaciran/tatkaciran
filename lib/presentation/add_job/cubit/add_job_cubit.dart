import 'package:address_repository/address_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class AddJobCubit extends Cubit<AddJobState> {
  AddJobCubit() : super(const AddJobState());

  void addLatLng(LatLng latlng) => emit(state.copyWith(latlng: latlng));
  void addSalary(double salary) => emit(state.copyWith(salary: salary));
  void addDescription(String description) =>
      emit(state.copyWith(description: description));
  void addExpiryDate(int expiryDate) =>
      emit(state.copyWith(expiryDate: expiryDate));
}

class AddJobState extends Equatable {
  final LatLng latlng;
  final double salary;
  final String description;
  final int expiryDate;

  const AddJobState({
    this.latlng = const LatLng.zero(),
    this.salary = 0,
    this.description = '',
    this.expiryDate = 1,
  });

  @override
  List<Object> get props => [latlng, salary, description, expiryDate];

  AddJobState copyWith({
    LatLng? latlng,
    double? salary,
    String? description,
    int? expiryDate,
  }) {
    return AddJobState(
      latlng: latlng ?? this.latlng,
      salary: salary ?? this.salary,
      description: description ?? this.description,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }
}
