import 'package:flutter/material.dart';
import 'package:instajobs/presentation/home/widgets/job_item/job_item.dart';
import 'package:provider/provider.dart';

class JobItemApplyButtonView extends StatelessWidget {
  const JobItemApplyButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobItemManager _manager = context.watch<JobItemManager>();
    return Padding(
      padding: _manager.applyButtonPadding,
      child: ElevatedButton(
        style: _manager.applyButtonStyle(context),
        child: Text(_manager.applyButtonLabel),
        onPressed: () => _manager.applyButtonOnPressed(context),
      ),
    );
  }
}
