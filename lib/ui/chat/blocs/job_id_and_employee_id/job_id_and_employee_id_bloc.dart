import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'job_id_and_employee_id_event.dart';
part 'job_id_and_employee_id_state.dart';

class JobIdAndEmployeeIdBloc
    extends Bloc<JobIdAndEmployeeIdEvent, JobIdAndEmployeeIdState> {
  // ! Burayı duzelt direkt job getir
  JobIdAndEmployeeIdBloc()
      : super(const GetJobIDAndEmployeeID(
          employeeID: '',
          jobID: '',
          displayName: '',
          employerID: '',
        )) {
    on<SetJobIDAndEmployeeID>((event, emit) => emit(
          GetJobIDAndEmployeeID(
            displayName: event.displayName,
            jobID: event.jobID,
            employeeID: event.employeeID,
            employerID: event.employerID,
          ),
        ));
  }
}
