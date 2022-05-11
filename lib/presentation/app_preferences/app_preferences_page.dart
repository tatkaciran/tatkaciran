import 'package:instajobs/constants/constants.dart';

import 'app_preferences.dart';

class AppPreferences extends StatelessWidget {
  const AppPreferences({Key? key}) : super(key: key);

  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const AppPreferences(),
      );

  @override
  Widget build(BuildContext context) {
    return const AppPreferencesView(
      preferences: [
        ThemePreference(),
        LogoutButton(),
      ],
    );
  }
}

class AppPreferencesView extends StatelessWidget {
  final List<Widget> preferences;

  const AppPreferencesView({Key? key, required this.preferences})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferencesListView(preferences);
  }
}

class PreferencesListView extends ListView {
  final List<Widget> preferences;
  PreferencesListView(this.preferences, {Key? key})
      : super.separated(
          key: key,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: preferences.length,
          itemBuilder: (BuildContext context, int i) => preferences[i],
          separatorBuilder: (BuildContext context, int i) => const Divider(),
        );
}
