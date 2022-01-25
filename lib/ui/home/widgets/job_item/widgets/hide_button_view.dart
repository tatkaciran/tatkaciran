import 'package:flutter/material.dart';
import 'package:instajobs/ui/home/widgets/job_item/job_item.dart';
import 'package:provider/provider.dart';

class JobItemHideButtonView extends StatelessWidget {
  const JobItemHideButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobItemManager _manager = context.watch<JobItemManager>();
    return TextButton.icon(
      icon: Icon(_manager.hideButtonIcon),
      onPressed: () => _manager.hideButtonOnPressed(context),
      label: Text(_manager.hideButtonLabel),
    );
  }
}
