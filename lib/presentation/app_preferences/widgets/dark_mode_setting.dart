import 'package:flutter/cupertino.dart';
import 'package:instajobs/constants/constants.dart';
import 'package:instajobs/presentation/app_preferences/managers/managers.dart';

class DarkModeSetting extends StatelessWidget {
  const DarkModeSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isThemeLight = context.watch<ThemeManager>().isThemeLight;
    return ListTile(
      onTap: () async {
        context.read<ThemeManager>().toggleTheme();
      },
      title: Text(context.l10n!.darkMode),
      trailing: Icon(!isThemeLight
          ? CupertinoIcons.lightbulb_fill
          : CupertinoIcons.lightbulb),
    );
  }
}
