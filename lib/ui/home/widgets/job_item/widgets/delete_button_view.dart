import 'package:flutter/material.dart';
import 'package:instajobs/ui/home/widgets/job_item/job_item_manager.dart';
import 'package:provider/provider.dart';

class JobItemDeleteButtonView extends StatelessWidget {
  const JobItemDeleteButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobItemManager _manager = context.watch<JobItemManager>();
    return TextButton.icon(
      icon: Icon(_manager.deleteButtonIcon),
      onPressed: () => _manager.deleteButtonOnPressed(context),
      label: Text(_manager.deleteButtonLabel),
    );
  }
}
