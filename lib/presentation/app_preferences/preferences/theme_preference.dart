import 'package:flutter/cupertino.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/presentation/app_preferences/managers/managers.dart';

import '../../../constants/constants.dart';

class ThemePreference extends StatelessWidget {
  const ThemePreference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async => toggleThemeRequest(context),
      title: Text(context.l10n!.darkMode),
      trailing: Icon(
        !isThemeLight(context)
            ? CupertinoIcons.lightbulb_fill
            : CupertinoIcons.lightbulb,
      ),
    );
  }
}

bool isThemeLight(BuildContext context) =>
    context.watch<ThemeManager>().isThemeLight;

Future<void> toggleThemeRequest(BuildContext context) async =>
    context.read<ThemeManager>().toggleTheme();
