import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'salary_event.dart';
part 'salary_state.dart';

class SalaryBloc extends Bloc<SalaryEvent, SalaryState> {
  SalaryBloc() : super(const GetSalary(salary: '0')) {
    on<AddSalary>((event, emit) => emit(GetSalary(salary: event.salary)));
  }
}
