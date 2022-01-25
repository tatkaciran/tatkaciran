import 'package:flutter/material.dart';
import 'package:instajobs/ui/home/widgets/job_item/job_item.dart';
import 'package:provider/provider.dart';

class JobItemSalaryView extends StatelessWidget {
  const JobItemSalaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobItemManager _manager = context.watch<JobItemManager>();
    return Text(
      _manager.salaryLabel,
      textScaleFactor: 1.30,
    );
  }
}
