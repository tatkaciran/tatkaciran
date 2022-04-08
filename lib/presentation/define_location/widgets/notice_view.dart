import 'package:flutter/material.dart';
import 'package:instajobs/constants/extensions/extensions.dart';

class NoticeView extends StatelessWidget {
  const NoticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String noticeText =
        'Çevrendeki iş ilanlarını görmek için önce bir konum tanımlamalısın. ';
    const String noticeText2 =
        '(Konum bilgileriniz iş ilanı yayınlamadıkça başkalarına gözükmez.)';
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      child: RichText(
        text: TextSpan(
          style: context.theme.textTheme.bodyText1,
          children: const [
            TextSpan(text: noticeText),
            TextSpan(text: noticeText2),
          ],
        ),
      ),
    );
  }
}
