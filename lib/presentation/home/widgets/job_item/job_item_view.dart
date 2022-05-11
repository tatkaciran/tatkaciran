import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:jobs_repository/jobs_repository.dart';

import '../../blocs/job/job_cubit.dart';
import 'widgets/widgets.dart';

class JobItem extends StatelessWidget {
  const JobItem(this._job, {this.inChat = false, Key? key}) : super(key: key);
  final Job _job;
  final bool inChat;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobCubit()..add(_job),
      child: JobListView(
        inChat: inChat,
        job: _job,
      ),
    );
  }
}

class JobListView extends StatelessWidget {
  const JobListView({
    Key? key,
    required this.inChat,
    required this.job,
  }) : super(key: key);
  final Job job;
  final bool inChat;

  @override
  Widget build(BuildContext context) {
    EdgeInsets _margin = const EdgeInsets.only(
      top: 12.0,
      left: 12.0,
      right: 12.0,
    );
    return Builder(builder: (context) {
      return Card(
        elevation: 0,
        margin: _margin,
        // color: _manager.backgroundColor(c),
        child: DecoratedBox(
          decoration: _boxDecoration(),
          child: Padding(
            padding: _margin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                JobItemHeaderView([
                  const JobItemCityView(),
                  JobItemSalaryView(salary: job.salary!),
                ]),
                JobItemDescriptionView(description: job.description!),
                JobItemFooterView([
                  JobItemExpiryDateView(expiryDate: job.expiryDate!),
                  JobItemUsernameView(username: job.userName!),
                ]),
                if (inChat) const SizedBox(height: 12),
                if (!inChat) const Divider(color: Colors.white54),
                if (!inChat) JobItemButtonsView(job: job),
              ],
            ),
          ),
        ),
      );
    });
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.010),
          Colors.white.withOpacity(0.000),
          Colors.white.withOpacity(0.010),
        ],
      ),
    );
  }
}
