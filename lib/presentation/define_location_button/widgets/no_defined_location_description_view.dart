import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';

class NoDefinedLocationDescriptionView extends StatelessWidget {
  const NoDefinedLocationDescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: RichText(
        text: TextSpan(
          // style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          style: context.theme.textTheme.bodyText1,
          children: const [
            TextSpan(text: 'Yakınındaki iş fırsatlarını\n'),
            TextSpan(text: 'görmek için konum seç')
          ],
        ),
      ),
    );
  }
}
