import 'package:flutter/material.dart';
import 'package:instajobs/ui/home/widgets/job_item/job_item.dart';
import 'package:instajobs/ui/job_details/job_details.dart';
import 'package:provider/provider.dart';

import 'apply_button_view.dart';
import 'delete_button_view.dart';
import 'hide_button_view.dart';

class JobItemButtonsView extends StatelessWidget {
  const JobItemButtonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobItemManager _manager = context.watch<JobItemManager>();
    return _manager.isUser(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              JobItemHideButtonView(),
              JobItemDeleteButtonView(),
            ],
          )
        : Row(
            children: const [
              Expanded(child: JobItemDetailButtonView()),
              SizedBox(width: 15),
              Expanded(child: JobItemApplyButtonView())
            ],
          );
  }
}

class JobItemDetailButtonView extends StatelessWidget {
  const JobItemDetailButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobItemManager _manager = context.watch<JobItemManager>();
    return Padding(
      padding: _manager.detailButtonPadding,
      child: ElevatedButton(
        style: _manager.detailButtonStyle(context),
        child: Text(_manager.detailButtonLabel),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => JobDetailView(
                      jobItemManager: _manager,
                    )),
          );
          // _manager.detailButtonOnPressed(context);
        },
      ),
    );
  }
}
