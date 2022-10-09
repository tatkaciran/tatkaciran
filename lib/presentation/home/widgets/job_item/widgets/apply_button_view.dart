import 'package:instajobs/config/config.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:jobs_repository/jobs_repository.dart';

class JobItemApplyButtonView extends StatelessWidget {
  final Job job;
  const JobItemApplyButtonView({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: context.theme.elevatedButtonTheme.style,
      child: const Text('Apply'),
      onPressed: () {
        context.read<ChatManager>().fromJobToChat(context, job);
        context.read<NavigationCubit>().showChat(true);
      },
    );
  }
}
