import 'package:flutter/material.dart';
import 'package:instajobs/ui/add_job/blocs/blocs.dart';
import 'package:instajobs/ui/auth/blocs/blocs.dart';
import 'package:instajobs/ui/home/blocs/blocs.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:uuid/uuid.dart';

class AddEditButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const AddEditButton(this.formKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isEditing = context
        .select((IsEditingBloc bloc) => (bloc.state as GetIsEditing).isEditing);

    final user = context.watch<AuthenticationBloc>().state.user;

    // final String getAddress = context
    //     .select((AddressBloc bloc) => (bloc.state as GetAddress).address);

    final String getDescription = context.select(
        (DescriptionBloc bloc) => (bloc.state as GetDescription).description);

    final int getExpiryDate = context.select(
        (ExpiryDateBloc bloc) => (bloc.state as GetExpiryDate).expiryDate);

    final String getSalary =
        context.select((SalaryBloc bloc) => (bloc.state as GetSalary).salary);

    return Padding(
      padding: margin,
      child: ElevatedButton(
        child: Padding(
          padding: padding,
          child: buttonTitle,
        ),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            context.read<JobsBloc>().add(
                  AddJob(
                    Job(
                      photo: user.photo,
                      jobID: const Uuid().v4(),
                      userID: user.id,
                      description: getDescription,
                      salary: getSalary,
                      expiryDate: getExpiryDate,
                      userName: user.name!,
                      isHidden: isEditing,
                    ),
                  ),
                );
            // _isEditing = false;
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Text get buttonTitle => const Text(
        'İlanı Onayla',
        style: TextStyle(fontSize: 18),
      );

  EdgeInsets get padding => const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 100,
      );

  EdgeInsets get margin => const EdgeInsets.only(
        top: 400,
        bottom: 400,
      );
}
