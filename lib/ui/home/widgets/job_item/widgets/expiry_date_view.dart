import 'package:flutter/material.dart';
import 'package:instajobs/ui/home/widgets/job_item/job_item.dart';
import 'package:provider/provider.dart';

class JobItemExpiryDateView extends StatelessWidget {
  const JobItemExpiryDateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobItemManager _manager = context.watch<JobItemManager>();
    return Text(
      _manager.expiryDateLabel,
      textScaleFactor: 1.20,
    );
  }
}
