import 'package:instajobs/config/managers/navigation_state_manager.dart';
import 'package:instajobs/constants/constants.dart';

class AddJobButton extends StatelessWidget {
  const AddJobButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'add-job-button',
      foregroundColor:
          Theme.of(context).floatingActionButtonTheme.foregroundColor,
      child: const Icon(Icons.add),
      onPressed: () {
        context.read<NavigationStateManager>().showAddJob(true);
      },
    );
  }
}
