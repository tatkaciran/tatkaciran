import 'package:flutter/material.dart';
import 'package:instajobs/presentation/define_location_button/define_location_button.dart';

import 'widgets/widgets.dart';

class DefineLocationView extends StatelessWidget {
  const DefineLocationView({Key? key}) : super(key: key);
  static Page page({LocalKey? key}) => MaterialPage<void>(
        key: key,
        child: const DefineLocationView(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          UserAvatarView(),
          // GreetingView(),
          DescriptionView(),
          // NoticeView(),

          DefineLocationButton(),
        ],
      ),
    );
  }
}
