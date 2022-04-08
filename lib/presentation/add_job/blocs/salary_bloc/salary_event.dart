part of 'salary_bloc.dart';

abstract class SalaryEvent extends Equatable {
  const SalaryEvent();

  @override
  List<Object> get props => [];
}

class AddSalary extends SalaryEvent {
  final String salary;

  const AddSalary({required this.salary});

  @override
  List<Object> get props => [salary];
}
