import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';
import 'package:instajobs/main_initializer.dart';

class GreetingView extends StatelessWidget {
  const GreetingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _userName = user.name!.split(' ').first;
    return RichText(
      text: TextSpan(
        style: context.theme.textTheme.headline4,
        children: [
          const TextSpan(text: 'Selam '),
          TextSpan(text: _userName),
        ],
      ),
    );
  }
}
