import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String description1 =
        '\n\nINSTAJOBS iş veya işçi bulma uygulaması değildir.';
    const String description2 =
        '\n\nINSTAJOBS iş yoğunlu olan insanlar ile yardım etmek isteyen insanları bir araya getiren uygulamadır. ';

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 12,
      ),
      child: RichText(
        text: TextSpan(
          style: context.theme.textTheme.bodyText2?.copyWith(fontSize: 18),
          children: const [
            TextSpan(
              text: description1,
            ),
            TextSpan(text: description2),
          ],
        ),
      ),
    );
  }
}
