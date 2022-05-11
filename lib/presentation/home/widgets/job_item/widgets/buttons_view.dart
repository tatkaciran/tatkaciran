import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/main_initializer.dart';

import 'package:instajobs/presentation/job_details/job_details.dart';
import 'package:jobs_repository/jobs_repository.dart';

import 'apply_button_view.dart';
import 'delete_button_view.dart';
import 'hide_button_view.dart';

class JobItemButtonsView extends StatelessWidget {
  final Job job;
  const JobItemButtonsView({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            JobItemHideButtonView(
              job: job,
            ),
            JobItemDeleteButtonView(job: job),
          ],
        ),
        secondChild: Row(
          children: [
            Expanded(child: JobItemDetailButtonView(job: job)),
            const SizedBox(width: 15),
            Expanded(child: JobItemApplyButtonView(job: job)),
          ],
        ),
        crossFadeState: job.userID == user.id
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: Duration.zero);
  }
}

class JobItemDetailButtonView extends StatelessWidget {
  final Job job;
  const JobItemDetailButtonView({Key? key, required this.job})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: ElevatedButton(
        style: context.theme.elevatedButtonTheme.style,
        child: const Text('Detail'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => JobDetailView(job: job)),
          );
          // _manager.detailButtonOnPressed(c);
        },
      ),
    );
  }
}
