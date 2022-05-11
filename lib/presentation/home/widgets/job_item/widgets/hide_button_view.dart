import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instajobs/presentation/home/blocs/blocs.dart';
import 'package:jobs_repository/jobs_repository.dart';
import 'package:provider/provider.dart';

class JobItemHideButtonView extends StatelessWidget {
  final Job job;
  const JobItemHideButtonView({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(
          job.isHidden! ? CupertinoIcons.eye_slash : CupertinoIcons.eye_fill),
      onPressed: () => context.read<JobsBloc>().add(UpdateJob(job.copyWith(
            isHidden: !job.isHidden!,
          ))),
      label: Text(job.isHidden! ? 'View Job' : 'Hide Job'),
    );
  }
}
