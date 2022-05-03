import 'package:flutter/material.dart';

import 'package:jobs_repository/jobs_repository.dart';
import 'package:provider/provider.dart';

import 'job_item_manager.dart';
import 'widgets/widgets.dart';

class JobItem extends StatelessWidget {
  const JobItem(this._job, {this.inChat = false, Key? key}) : super(key: key);
  final Job _job;
  final bool inChat;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JobItemManager(_job),
      child: Builder(builder: (context) {
        JobItemManager _manager = context.watch<JobItemManager>();
        return Card(
          elevation: 0,
          margin: _manager.margin,
          // color: _manager.backgroundColor(context),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.010),
                  Colors.white.withOpacity(0.000),
                  Colors.white.withOpacity(0.010),
                ],
              ),
            ),
            child: Padding(
              padding: _manager.margin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const JobItemHeaderView([
                    JobItemCityView(),
                    JobItemSalaryView(),
                  ]),
                  const JobItemDescriptionView(),
                  const JobItemFooterView([
                    JobItemExpiryDateView(),
                    JobItemUsernameView(),
                  ]),
                  if (inChat) const SizedBox(height: 12),
                  if (!inChat) const Divider(color: Colors.white54),
                  if (!inChat) const JobItemButtonsView(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
