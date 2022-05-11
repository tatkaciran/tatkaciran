import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';

class NoDefinedLocationLabelView extends StatelessWidget {
  const NoDefinedLocationLabelView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.end,
      text: TextSpan(
        style: context.theme.textTheme.headline6!
            .copyWith(fontWeight: FontWeight.bold),
        children: const [TextSpan(text: 'Konum\n'), TextSpan(text: 'seç')],
      ),
    );
  }
}
