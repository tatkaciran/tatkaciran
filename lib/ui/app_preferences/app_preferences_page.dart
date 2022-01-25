import 'package:instajobs/constants/constants.dart';

import 'app_preferences.dart';

class AppSettingsPage extends StatelessWidget {
  const AppSettingsPage({Key? key}) : super(key: key);
  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const AppSettingsPage(),
      );
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: appSettingsItemList.length,
      itemBuilder: appSettingsItems,
      separatorBuilder: appSeperatorItem,
    );
  }
}
