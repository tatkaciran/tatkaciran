part of 'salary_bloc.dart';

abstract class SalaryState extends Equatable {
  const SalaryState();

  @override
  List<Object> get props => [];
}

class GetSalary extends SalaryState {
  final String salary;

  const GetSalary({required this.salary});

  @override
  List<Object> get props => [salary];
}
