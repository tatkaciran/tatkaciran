import 'package:flutter/material.dart';

import 'widgets.dart';

Widget appSettingsItems(BuildContext context, int index) {
  return appSettingsItemList[index];
}

const List<Widget> appSettingsItemList = [
  DarkModeSetting(),
  LogoutButton(),
];
