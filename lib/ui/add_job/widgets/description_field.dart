import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instajobs/ui/add_job/add_job_page_widgets.dart';
import 'package:instajobs/ui/add_job/blocs/blocs.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: AddJobPageWidgets.descriptionFieldChildren(
          onChanged: (value) => context
              .read<DescriptionBloc>()
              .add(AddDecription(description: value!)),
        ),
      ),
    );
  }
}
