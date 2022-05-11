import 'package:flutter/cupertino.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/presentation/home/blocs/blocs.dart';
import 'package:jobs_repository/jobs_repository.dart';

class JobItemDeleteButtonView extends StatelessWidget {
  final Job job;
  const JobItemDeleteButtonView({Key? key, required this.job})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(CupertinoIcons.delete_solid),
      onPressed: () => context.read<JobsBloc>().add(DeleteJob(job)),
      label: const Text('Delete Job'),
    );
  }
}
